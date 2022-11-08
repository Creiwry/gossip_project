# frozen_string_literal: true

# Gossip model
class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_of_gossips, dependent: :destroy
  has_many :tags, through: :tag_of_gossips
end
