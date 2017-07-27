class RemoveAudioFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :audio
  end
end
