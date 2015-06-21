class AddWojewodztwoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wojewodztwo, :string
  end
end
