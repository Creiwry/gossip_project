# frozen_string_literal: true

# City model
class City < ApplicationRecord
  has_many :users
end
