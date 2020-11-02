class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :pm_receivers
  has_many :private_messages, through: :pm_receivers
  has_many :gossip_comments
  has_many :gossip_likes
  has_secure_password

  validates :password, presence: true
  validates :password, length: { minimum: 3 }

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
