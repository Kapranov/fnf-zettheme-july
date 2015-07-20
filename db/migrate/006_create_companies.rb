class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
    add_index :companies, :user_id
    add_foreign_key(:companies, :users, dependent: :delete)
  end
end
