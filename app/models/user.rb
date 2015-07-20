class User < ActiveRecord::Base
  has_many :categories
  has_many :dashboards
  has_many :products
  has_many :companies

  attachment :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  translates :name, fallbacks_for_empty_translations: true

  def to_s
    "#{name}"
  end
end
