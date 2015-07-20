class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name
      t.string :sku
      t.text :description
      t.text :short_description
      t.boolean :active
      t.decimal :weight, precision: 12, scale: 3
      t.decimal :price,  precision: 12, scale: 3
      t.decimal :cost_price, precision: 12, scale: 3
      t.boolean :featured
      t.boolean :stock_control
      t.belongs_to :category

      t.timestamps null: false
    end
    add_index :products, :user_id
    add_foreign_key(:products, :users, dependent: :delete)
  end
end
