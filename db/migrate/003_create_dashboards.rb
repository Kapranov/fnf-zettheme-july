class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.belongs_to :user

      t.timestamps null: false
    end
    add_index :dashboards, :user_id, unique: true
    add_foreign_key(:dashboards, :users, dependent: :delete)
  end
end
