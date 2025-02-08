# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  let(:user) { create(:user) }
  let(:chat_room) { create(:chat_room) }
  let(:valid_attributes) { { content: 'Hello, world!', user_id: user.id, chat_room_id: chat_room.id } }

  before do
    sign_in user
  end

  describe 'POST /messages' do
    it 'creates a new message and returns a Turbo Stream response' do
      post chat_room_messages_path(chat_room), params: { message: valid_attributes },
                                               headers: { 'Accept' => 'text/vnd.turbo-stream.html' }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to include('text/vnd.turbo-stream.html')

      # Check that the response body contains the expected Turbo Stream format
      expect(response.body).to include('<turbo-stream action="append" target="messages">')
      expect(response.body).to include("<strong>#{user.email}:</strong>")
      expect(response.body).to include('Hello, world!')
    end
  end
end
