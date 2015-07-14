class ChangeFloatsToDecimals < ActiveRecord::Migration
  def change
    change_column :adverts, :price, :decimal
    change_column :adverts, :size2, :decimal
  end
end
