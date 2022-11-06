class Tag < ApplicationRecord
  has_many :tag_of_gossips
  has_many :gossips, through: :tag_of_gossips
end
