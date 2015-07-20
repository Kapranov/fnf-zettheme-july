class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key
      t.string :value
      t.belongs_to :product

      t.timestamps null: false
    end
    add_index :properties, :product_id
    add_foreign_key(:properties, :products, dependent: :delete)
  end
end
