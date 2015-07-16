class AddInvitationsLeftToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitations_left, :integer, { default: 5 }
  end
end
