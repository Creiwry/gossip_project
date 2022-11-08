# frozen_string_literal: true

# Tag model
class Tag < ApplicationRecord
  has_many :tag_of_gossips, dependent: :destroy
  has_many :gossips, through: :tag_of_gossips
end
