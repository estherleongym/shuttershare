class User < ApplicationRecord

  validates :email_address, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password



end
