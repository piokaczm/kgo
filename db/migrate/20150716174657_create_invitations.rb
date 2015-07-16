class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.text :email
      t.boolean :used?
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :invitations, :users
  end
end
