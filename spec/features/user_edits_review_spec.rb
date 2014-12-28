require 'rails_helper'

feature "User edits review" do

#    %q(
#   As a user
#   I want to edit a review
#   So that I can correct any mistakes or add updates
#
#   Acceptance Criteria
#
#   [x] I must provide valid information
#   [x] I must be presented with errors if I fill out the form incorrectly
#   [x] I must be able to get to the edit page from the question details page
# )

scenario "User edits review" do

  user = FactoryGirl.build(:user)
  book = FactoryGirl.create(:book)
  review = FactoryGirl.create(:review)

  visit root_path
  click_on "Sign up"

  fill_in "First Name", with: user.first_name
  fill_in "Last Name", with: user.last_name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_on "Register"

  visit root_path

  click_on book.title

  click_on "Review Book"
  fill_in "Review", with: "This book was great. I really enjoyed it. What a great book! Great. So great."
  click_on "Create Review"

  expect(page).to have_content "Review was successfully created"
  click_on book.title

  click_on "Edit Review"
  fill_in "Review", with: review.review

  click_on "Edit Review"

  expect(page).to have_content "Review was successfully edited"
  end

scenario "User provides incorrect information" do
  user = FactoryGirl.build(:user)
  book = FactoryGirl.create(:book)
  review = FactoryGirl.create(:review)

  visit root_path
  click_on "Sign up"

  fill_in "First Name", with: user.first_name
  fill_in "Last Name", with: user.last_name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_on "Register"

  visit root_path

  click_on book.title

  click_on "Review Book"
  fill_in "Review", with: review.review
  click_on "Create Review"

  expect(page).to have_content "Review was successfully created"
  click_on book.title

  click_on "Edit Review"
  fill_in "Review", with: "It was OK"

  click_on "Edit Review"

  expect(page).to have_content "Review is too short (minimum is 50 characters)"
end
end
