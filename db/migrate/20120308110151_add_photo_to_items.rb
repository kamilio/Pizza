class AddPhotoToItems < ActiveRecord::Migration
  def change
    add_column :items, :photo, :binary
  end
end
