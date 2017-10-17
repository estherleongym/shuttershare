require 'rails_helper'

RSpec.describe "Logins", type: :request do
  it "allows user to with valid email address and password to login" do
    user = FactoryGirl(:user)
    visit root_path
    fill_in "Email", :with => user.email_address
    fill_in "Password", :with => user.password_digest
    click_button "Submit"
  end

end
