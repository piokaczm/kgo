class DropAdvertContact < ActiveRecord::Migration
  def change
    drop_table :advert_contacts
  end
end
