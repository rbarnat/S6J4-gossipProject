class GossipComment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user

  validates :content, presence: true
end
