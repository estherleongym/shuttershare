require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { FactoryGirl.build(:photo) }
      it do
        should belong_to(:user)
        with_foreign_key('user_id')
      end
    end
