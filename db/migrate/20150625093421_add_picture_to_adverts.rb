class AddPictureToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :picture, :string
  end
end
