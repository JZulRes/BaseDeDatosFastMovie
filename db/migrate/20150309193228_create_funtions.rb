class CreateFuntions < ActiveRecord::Migration
  def change
    create_table :funtions do |t|
      t.integer :movie_id
      t.time :hora
      t.string :sala

      t.timestamps null: false
    end
  end
end
