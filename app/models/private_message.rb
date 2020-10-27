class PrivateMessage < ApplicationRecord
  belongs_to :user
  has_many :pm_receivers
  has_many :users, through: :pm_receivers
end
