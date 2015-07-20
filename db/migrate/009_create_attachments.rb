class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :product
      t.belongs_to :company
      t.string :attach_id
      t.string :attach_filename
      t.integer :attach_size
      t.string :attach_content_type

      t.timestamps null: false
    end
    add_index :attachments, :product_id
    add_index :attachments, :company_id
    add_foreign_key(:attachments, :products, dependent: :delete)
    add_foreign_key(:attachments, :companies, dependent: :delete)
  end
end
