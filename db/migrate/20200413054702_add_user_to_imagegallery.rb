class AddUserToImagegallery < ActiveRecord::Migration[6.0]

  def change
    add_reference :imagegalleries, :user,foreign_key:  true
  end

end
