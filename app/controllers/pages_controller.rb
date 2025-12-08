class PagesController < ApplicationController

  def chatbot
    # Logic for the chatbot page
    @chat = Chat.new
    @navbar = true
    @text = "Welcome to Yarni"
  end

  def home
  end
end
