class AddAttachmentThumbnailToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :movies, :thumbnail
  end
end
