class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.string :status, null: false
      t.decimal :price, null: false
      t.date :rent_date, null: false
      t.date :return_date, null: false
      t.references :client, foreign_key: true
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
