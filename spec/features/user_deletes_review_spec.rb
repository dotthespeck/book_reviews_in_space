require 'rails_helper'

feature "User deletes a review" do
# %q(
#   As a user
#   I want to delete a review
#   So that I can delete my review if I no longer want to show it
#
#   Acceptance Criteria
#
#   [x] I must be able delete a review from the review edit page
#   [] I must be able delete a review from the review details page - I didn't understand what this meant
#)

  scenario "User deletes a review" do

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
    click_on "Delete"

    expect(page).to have_content "Review was successfully deleted"
  end

end
