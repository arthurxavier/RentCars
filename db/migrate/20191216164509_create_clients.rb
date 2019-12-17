class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :cpf, limit: 11, null: false
      t.string :cnh, limit: 11, null: false
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
