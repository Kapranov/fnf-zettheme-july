class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.boolean :displayed

      t.timestamps null: false
    end
    add_index :categories, :user_id
    add_foreign_key(:categories, :users, dependent: :delete)
  end
end
