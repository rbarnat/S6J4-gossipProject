class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  has_many :gossip_comments
  has_many :gossip_likes

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
end
