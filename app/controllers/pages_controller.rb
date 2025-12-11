class PagesController < ApplicationController

  def chatbot
    # Logic for the chatbot page
    @chat = Chat.new
    @navbar = true
    @text = "Welcome to Yarni"
  end

  def profile
    @navbar = true
    @text= "My Profile"
    @finished_projects = current_user.projects.where(status: "finished")
    @projects = current_user.projects.where(status: "ongoing")
  end

  def home
  end
end
