class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.belongs_to :product
      t.belongs_to :company
      t.string :avatar_id
      t.string :attach_filename
      t.integer :attach_size
      t.string :attach_content_type

      t.timestamps null: false
    end
    add_index :uploads, :product_id
    add_index :uploads, :company_id
    add_foreign_key(:uploads, :products, dependent: :delete)
    add_foreign_key(:uploads, :companies, dependent: :delete)
  end
end
