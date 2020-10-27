class CreateGossips < ActiveRecord::Migration[6.0]
  def change
    create_table :gossips do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.belongs_to :city, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
