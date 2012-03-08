class AddPhotoSettingsToItems < ActiveRecord::Migration
  def change
    add_column :items, :photo_type, :string
    add_column :items, :photo_filename, :string
  end
end
