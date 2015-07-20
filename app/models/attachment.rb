class Attachment < ActiveRecord::Base
  belongs_to :product
  belongs_to :company

  attachment :attach

end
