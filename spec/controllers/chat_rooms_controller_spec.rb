# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  let(:valid_attributes) { { name: 'Test Room' } }
  let(:invalid_attributes) { { name: '' } }

  before do
    @chat_room = create(:chat_room)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      ChatRoom.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      chat_room = ChatRoom.create! valid_attributes
      get :show, params: { id: chat_room.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new ChatRoom' do
        expect do
          post :create, params: { chat_room: valid_attributes }
        end.to change(ChatRoom, :count).by(1)
      end

      it 'redirects to the created chat room' do
        post :create, params: { chat_room: valid_attributes }
        expect(response).to redirect_to(ChatRoom.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new ChatRoom' do
        expect do
          post :create, params: { chat_room: invalid_attributes }
        end.to change(ChatRoom, :count).by(0)
      end

      it 'renders the new template' do
        post :create, params: { chat_room: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
end
