class CreatePrivateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
