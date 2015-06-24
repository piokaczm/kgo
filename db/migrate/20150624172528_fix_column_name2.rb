class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :adverts, :type, :category
  end
end
