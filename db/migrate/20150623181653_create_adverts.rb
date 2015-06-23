class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :content
      t.float :price
      t.string :wojewodztwo
      t.boolean :new
      t.string :type
      t.integer :size1
      t.float :size2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :adverts, [:user_id, :created_at]
  end
end
