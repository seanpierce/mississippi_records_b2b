class CreateMerches < ActiveRecord::Migration[5.1]
  def change
    create_table :merches do |t|
      t.string :name
      t.text :description
      t.integer :proce
      t.string :image

      t.timestamps
    end
  end
end
