class BackToFloats < ActiveRecord::Migration
  def change
    change_column :adverts, :price, :float
    change_column :adverts, :size2, :float
  end
end
