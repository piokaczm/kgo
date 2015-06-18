class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :surename
      t.string :email
      t.string :address
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
