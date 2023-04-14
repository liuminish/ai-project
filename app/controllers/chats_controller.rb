class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :add_message]
  def index
    @chats = Chat.includes(:messages)
  end

  def show
  end

  def start_new
    @chat = Chat.create!
    @chat.add_message(content: params[:content])
    AiClient::new(@chat).call
    redirect_to(@chat)
  end

  def add_message
    @chat.add_message(content: permitted_params_content)
    AiClient::new(@chat).call
    redirect_to(@chat)
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def permitted_params_content
    params.require(:chat).permit(:content)[:content]
  end
end
