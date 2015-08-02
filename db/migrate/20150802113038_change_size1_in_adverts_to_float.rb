class ChangeSize1InAdvertsToFloat < ActiveRecord::Migration
  def change
    change_column :adverts, :size1, :float
  end
end
