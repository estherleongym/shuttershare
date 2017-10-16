class Photo < ApplicationRecord

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  mount_uploader :photo, PhotoUploader

end
