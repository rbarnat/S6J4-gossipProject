class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
end
