class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age
      t.belongs_to :city, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
