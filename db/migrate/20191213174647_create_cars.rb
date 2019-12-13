class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand, limit: 255, null: false
      t.string :model, limit: 255, null: false
      t.integer :manufacture_year, null: false
      t.integer :model_year, null: false
      t.string :transmission, null: false
      t.integer :gears
      t.integer :doors
      t.string :color, null: false
      t.string :seats_option

      t.timestamps
    end
  end
end
