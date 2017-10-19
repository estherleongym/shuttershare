require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

RSpec.describe Photo, type: :model do
  subject { FactoryGirl.build(:photo) }
      it do
        should belong_to(:user).
           with_foreign_key('user_id')
      end
    end

    context "has_photos(user): " do
      it "checks if user has uploaded any photos" do
        DatabaseCleaner.clean

        user = create(:user2)
        photo = create(:photo1, user_id: user.id)
        expect( Photo.has_photos?(user) ).to eq true
      end
      it "returns false when there are no photos tied to user" do
        DatabaseCleaner.clean
    
        user = create(:user2)
        expect( Photo.has_photos?(user) ).to eq false
      end
    end
