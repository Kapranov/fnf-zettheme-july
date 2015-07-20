class TranslateProperties < ActiveRecord::Migration
  def self.up
    Property.create_translation_table!({
      key: :string,
      value: :string
    }, {
      migrate_data: true
    })
  end

  def self.down
    Property.drop_translation_table! migrate_data: true
  end
end
