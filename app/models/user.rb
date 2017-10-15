class User < ApplicationRecord

  validates :email_address, uniqueness: true, presence: true, :on => :create
  validates :username, uniqueness: true, presence: true, :on => :create
  validates_presence_of :password, :on => :create
  has_secure_password
  mount_uploader :display_picture, DisplayPictureUploader

end
