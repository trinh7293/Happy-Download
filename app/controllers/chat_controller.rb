class ChatController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = User.all - [Array.new << current_user]
    @conversations = Conversation.includes(:recipient, :messages)
      .find session[:conversations]
  end
end
