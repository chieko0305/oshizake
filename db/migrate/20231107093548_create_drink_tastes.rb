class CreateDrinkTastes < ActiveRecord::Migration[6.1]
  def change
    create_table :drink_tastes do |t|

      t.integer :drink_id,             null: false
      t.integer :taste_id,             null: false
      t.timestamps
    end
  end
end
