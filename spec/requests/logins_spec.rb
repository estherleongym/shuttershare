require 'rails_helper'

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe "Logins", type: :request do
  it "allows user to with valid email address and password to login" do
    user = create(:user)
    visit root_path
    fill_in "user_email_address", :with => user.email_address
    fill_in "user_password", :with => user.password
    click_on("Submit")
  end
end
