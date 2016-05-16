class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :sinopsis
      t.string :clasificacion
      t.string :image
      t.integer :calificacion
      t.string :genre

      t.timestamps null: false
    end
  end
end
