class CreateAdvertContacts < ActiveRecord::Migration
  def change
    create_table :advert_contacts do |t|

      t.timestamps null: false
    end
  end
end

