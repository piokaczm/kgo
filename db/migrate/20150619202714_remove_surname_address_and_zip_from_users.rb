class RemoveSurnameAddressAndZipFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :surname, :string
    remove_column :users, :address, :string
    remove_column :users, :zip, :string
  end
end
