require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it 'is valid with valid attributes' do
    room = ChatRoom.new(name: 'Test Room')
    expect(room).to be_valid
  end
end
