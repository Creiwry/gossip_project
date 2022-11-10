# frozen_string_literal: true

require_relative './validators/is_not_sender_validator'

# PrivateMessage model
class PrivateMessage < ApplicationRecord
  validates :content, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates_with IsNotSender
end
