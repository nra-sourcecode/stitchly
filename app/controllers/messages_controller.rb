class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat


  SYSTEM_PROMPT = "You are a professional knitter that helps to users to...."

  def new
    @message = @chat.messages.new
  end

  def create
    @message = @chat.messages.new(message_params)
    @message.role = "user" # every message created here is from the user

    if @message.save
      @assistant_message = @chat.messages.create(role: "assistant", content: "")
      @assistant_message.created_at = Time.now
      @ruby_llm_chat = RubyLLM.chat.with_temperature(0.7)
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content) do |chunk|
        next if chunk.content.blank? # skip empty chunks

        @assistant_message.content += chunk.content

        sleep 1.0/24.0

        broadcast_replace(@assistant_message)
      end
      # Message.create(chat: @chat, content: response.content, role: "assistant")
      # @chat.generate_title_from_user_messages
      # Respond to Turbo Stream requests
      @assistant_message.update(content: response.content)
      broadcast_replace(@assistant_message)

      respond_to do |format|
        format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  def build_conversation_history
    @chat.messages.each do |message|
      next if message.content.blank?
      @ruby_llm_chat.add_message(message)
    end
  end



    # def prefilled
    #   if @chat.messages.first
    #     @prefilled = @chat.message.content
    #   else
    #     @prefilled = ""
    #   end
    # end

  private

  def set_chat
    @chat = current_user.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  # def pdf_pattern
  #   url_for(@project.pattern) if @project.pattern.attached?
  # end

  # def instruction_context
  #   [SYSTEM_PROMPT, pdf_pattern].compact.join("\n\n")
  # end

  def broadcast_replace(message)
    Turbo::StreamsChannel.broadcast_replace_to(@chat, target: "chat-#{helpers.dom_id(message)}", partial: "messages/message", locals: { message: message })
  end
end
