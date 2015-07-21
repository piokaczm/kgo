class AddGalleryToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :gallery_link, :string
  end
end
