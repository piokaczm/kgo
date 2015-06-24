class AddCityToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :city, :string
  end
end
