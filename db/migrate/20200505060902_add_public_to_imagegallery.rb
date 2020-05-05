class AddPublicToImagegallery < ActiveRecord::Migration[6.0]
  def change
    add_column :imagegalleries, :public, :boolean, default: false
  end
end
