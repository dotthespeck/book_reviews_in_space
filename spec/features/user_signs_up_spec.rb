require "rails_helper"

feature "User signs up for site" do

  # As a prospective user
  # I want to create an account
  # So that I can post books and review them

  scenario "User provides valid information" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Buzz"
    fill_in "Last Name", with: "Aldren"
    fill_in "Email", with: "buzz@aldren.com"
    fill_in "Password", with: "moonman1"
    fill_in "Password confirmation", with: "moonman1"
    click_on "Sign up"

    expect(page).to have_content 'Welcome, Space Reviewer!'
  end
end
