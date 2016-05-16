class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :place
      t.string :direccion
      t.integer :funtion_id

      t.timestamps null: false
    end
  end
end
