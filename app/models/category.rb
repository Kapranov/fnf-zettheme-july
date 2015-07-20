class Category < ActiveRecord::Base
  belongs_to :user
  has_many :products

  translates :name, :description, fallbacks_for_empty_translations: true

  def to_s
    "#{name}"
  end
end
