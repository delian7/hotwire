# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.new(message_params)
    @message.user = current_user # Assuming you have user authentication

    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_room_path(@chat_room) }
      end
    else
      render 'chat_rooms/show' # Handle error case
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
