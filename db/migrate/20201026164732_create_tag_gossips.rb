class CreateTagGossips < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_gossips do |t|
      t.belongs_to :tag, null: false, foreign_key: true, index: true
      t.belongs_to :gossip, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
