class User < ApplicationRecord

  validates :email_address, uniqueness: true, presence: true, :on => :create
  validates :username, uniqueness: true, presence: true, :on => :create
  validates_presence_of :password, :on => :create
  has_secure_password
  mount_uploader :display_picture, DisplayPictureUploader
  has_many :authentications, dependent: :destroy
  has_many :photos, class_name: "Photo", foreign_key: "user_id"

  def self.create_with_auth_and_hash(authentication, auth_hash)

    user = self.create!(
      full_name: auth_hash["extra"]["raw_info"]["name"],
      email_address: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(2),
      username: SecureRandom.hex(2),
        )
        user.authentications << authentication
        return user
      end

      # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

  def self.search(search)
    if search
      
      return User.where("username ILIKE ? OR email_address ILIKE ? OR full_name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      flash[:error] = "Query did not return any matches"
      return User.all
    end
  end
end
