class AddAudioAttachment < ActiveRecord::Migration[5.1]
  def up
    add_attachment :albums, :audio
  end

  def down
    remove_attachment :albums, :audio
  end
end
