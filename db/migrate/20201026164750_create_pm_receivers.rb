class CreatePmReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :pm_receivers do |t|
      t.belongs_to :private_message, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
