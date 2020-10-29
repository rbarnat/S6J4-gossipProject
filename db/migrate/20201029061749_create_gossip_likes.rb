class CreateGossipLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :gossip_likes do |t|
      t.belongs_to :gossip, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
