require 'rails_helper'

feature "user reviews a book", %q(
  As a user
  I want to review a book
  So I can let other users know what I thought about it

Acceptance Criteria

  [x] I must be on the book detail page
  [] I must provide a description that is at least 50 characters long
  [] I must be presented with errors if I fill out the form incorrectly
) do

scenario "User creates a review" do

  user = FactoryGirl.build(:user)
  book = FactoryGirl.create(:book)

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

  click_on "Review book"
  fill_in "Review", with: "This book was great. I really enjoyed it. What a great book! Great. So great."
  click_on "Create Review"

  expect(page).to have_content "Review was successfully created"
  end

scenario "User review is too short" do

  user = FactoryGirl.build(:user)
  book = FactoryGirl.create(:book)
  
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

  click_on "Review book"
  fill_in "Review", with: "Awesome!"
  expect(page).to have_content "Review is too short"
  end

end
