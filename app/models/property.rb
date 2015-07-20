class Property < ActiveRecord::Base
  belongs_to :product
  translates :key, :value, fallbacks_for_empty_translations: true
end
