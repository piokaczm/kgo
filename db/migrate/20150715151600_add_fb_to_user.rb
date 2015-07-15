class AddFbToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_profile, :string
  end
end
