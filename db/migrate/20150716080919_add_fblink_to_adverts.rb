class AddFblinkToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :fb_link, :string
  end
end
