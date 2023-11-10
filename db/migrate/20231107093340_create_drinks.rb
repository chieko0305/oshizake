class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.integer :user_id,           null: false
      t.string :brand,              null: false
      t.text :text
      t.integer :genre,             null: false
      t.timestamps
    end
  end
end
