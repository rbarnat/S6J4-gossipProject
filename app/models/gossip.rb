class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 14 }
  validates :content, presence: true
end
