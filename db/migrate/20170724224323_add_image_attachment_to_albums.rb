class AddImageAttachmentToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_attachment :albums, :image
  end
end
