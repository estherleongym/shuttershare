class Photo < ApplicationRecord

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  mount_uploader :photo, PhotoUploader

  def self.has_photos?(user)
  
    @user = user
      if @user.photos.empty?
        return false
      else
        return true
      end
    end
  end
