class CreateGossipComments < ActiveRecord::Migration[6.0]
  def change
    create_table :gossip_comments do |t|
      t.string :content
      t.belongs_to :gossip, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
