class AddCatalogAndCategoryToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :catalog, :string
    add_column :albums, :category, :string
  end
end
