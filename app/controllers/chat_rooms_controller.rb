# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      redirect_to chat_room_path(@chat_room), notice: 'Chat room was successfully created.'
    else
      render :new
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
