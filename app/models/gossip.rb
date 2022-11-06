class Gossip < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :tag_of_gossips
  has_many :tags, through: :tag_of_gossips

end
