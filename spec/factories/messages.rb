# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    content { 'Test Content' }
    user { create(:user) }
    chat_room { create(:chat_room) }
  end
end
