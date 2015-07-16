class AddDefaultValueToInvitations < ActiveRecord::Migration
  def change
    change_column :invitations, :used?, :boolean, { default: false }
  end
end
