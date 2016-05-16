class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.datetime :fecha
      t.integer :funtion_id

      t.timestamps null: false
    end
  end
end
