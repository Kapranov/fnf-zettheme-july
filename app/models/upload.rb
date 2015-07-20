class Upload < ActiveRecord::Base
  belongs_to :product
  belongs_to :company

  attachment :avatar, type: :image

  after_destroy :remove_avatar

  private
    def remove_avatar
      avatar.delete
    end
end
