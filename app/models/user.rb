class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :pm_receivers
  has_many :private_messages, through: :pm_receivers
end
