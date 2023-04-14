class MessagesController < ApplicationController
  def show
    -
  end

  def new
    @message = Message.new
  end

  def create
    # call ai_client service
    # saves response in response
  end

  def add_message
    #
  end

  private

  def generated_response_params
    params.permit(:input, :response)
  end

  def generated_response
    @generated_response ||= generated_response.find(params[:id])
  end
end
