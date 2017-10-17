require 'rails_helper'

  RSpec.describe User, type: :model do
      describe "validations" do
        subject { FactoryGirl.build(:user) }
          it { should validate_uniqueness_of(:email_address) }
          it { should validate_uniqueness_of(:username) }
          it { should have_secure_password }
          it { should belong_to(:commentable) }
        end

        describe "validations" do
          subject { FactoryGirl.build(:user2) }
            it { should validate_uniqueness_of(:email_address) }
            it { should validate_uniqueness_of(:username) }
            it { should have_secure_password }
          end

  end
