# frozen_string_literal: true

# TagOfGossip model
class TagOfGossip < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end
