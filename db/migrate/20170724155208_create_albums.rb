class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.text :description
      t.integer :price
      t.string :image
      t.string :audio

      t.timestamps
    end
  end
end
