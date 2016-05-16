class CreateCines < ActiveRecord::Migration
  def change
    create_table :cines do |t|
      t.string :name
      t.integer :theater_id

      t.timestamps null: false
    end
  end
end
