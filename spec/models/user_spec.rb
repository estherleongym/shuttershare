require 'rails_helper'

describe User do
  context 'validations' do
    before { FactoryGirl.build(:user) }

    it do
      should validate_uniqueness_of(:email_address)
      should validate_uniqueness_of(:username)
      should validate_presence_of(:password_digest)
    end
  end
end
