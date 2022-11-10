# frozen_string_literal: true

# City model
class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true
  has_many :users
end
