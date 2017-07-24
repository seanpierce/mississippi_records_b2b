class ChangeImageFromStringToAttachmentForAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :image
  end
end
