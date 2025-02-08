require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:room) { ChatRoom.create(name: 'Test Room') }
  let(:user) { User.create(email: 'delian7@gmail.com') }

  it 'is valid with valid attributes' do
    message = Message.new(content: 'test content', chat_room: room, user: user)
    expect(message).to be_valid
  end
end
