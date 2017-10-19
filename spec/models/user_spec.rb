require 'rails_helper'

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

  RSpec.describe User, type: :model do
    context "validation: " do
        subject { FactoryGirl.build(:user) }
          it { should validate_uniqueness_of(:email_address) }
          it { should validate_uniqueness_of(:username) }
          it { should have_secure_password }
    DatabaseCleaner.clean
        end

    context "validation: " do
      subject { FactoryGirl.build(:user2) }
        it { should validate_uniqueness_of(:email_address) }
        end
    DatabaseCleaner.clean

    context "self.search(search): " do
  		it "searches for a match in username based on keyword provided" do
        DatabaseCleaner.clean
        create(:user)
  			expect{ User.search("estherleongym") }.not_to raise_error
  		end

      it "returns all users when no match is found based on keyword provided" do
        DatabaseCleaner.clean
        create(:user3)
        create(:user4)
  			expect(User.search("eviethebot")).to eq User.all.first
  		end
    end
  end
