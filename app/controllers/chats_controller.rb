# If I am a logged in user:When I go to /chats/new -> I should see Yarni welcome page to start a new chat
# I click on the “Tallk to Yarni” form
# When my chat is successfully created  -> Then I should be redirected to /chats/:id -> And I should see my conversation screen


class ChatsController < ApplicationController
  # before_action :authenticate_user!
  # only logged in users can access new, create, show

  def new
    @chat = Chat.new
    @navbar = true
    @text = "Yarni"
  end

  def create
    @chat = Chat.new
    @chat.user = current_user


    @chat.save
      # create the first assistant message
      @chat.messages.create!(
        role: "assistant",
        content: "Hello, this is Yarni! I'm ready to help. What can I do for your project today?"
      )
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.order(:created_at)
    @message = Message.new
    @navbar = true
    @text = "Yarni"
    # @bottom_bar = true //to update once we have the bottom bar
  end

  private

  # def chat_params
  #   params.require(:chat).permit()
  # end
end
