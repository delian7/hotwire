# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  has_many :messages

  validates :name, presence: true
end
