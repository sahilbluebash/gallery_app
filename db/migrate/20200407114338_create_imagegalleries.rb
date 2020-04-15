class CreateImagegalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :imagegalleries do |t|
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
