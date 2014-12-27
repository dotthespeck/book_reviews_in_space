require 'rails_helper'

feature "User sees reviews", %q(

  As a user
  I want to view the reviews for a book
  So that I can see what people are saying about it

  Acceptance Criteria

   [x] I must be on the book detail page
   [x] I must only see reviews to books I'm viewing
   [x] I must see all reviews listed in order, most recent first
   [x] I must see if the writer of the review is a candidate or an astronaut

) do

  scenario "User reads reviews" do
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

    click_on "Review book"
    fill_in "Review", with: review.review
    click_on "Create Review"

    expect(page).to have_content "Review was successfully created"

    visit root_path
    click_on book.title

    expect(page).to have_content review.review
  end

  scenario "Most recent posted first" do

    user = FactoryGirl.build(:user)
    book = FactoryGirl.create(:book)
    review = FactoryGirl.create(:review)
    second_review = FactoryGirl.create(:review, review: "What a completely amazing and fantastic book! Wow! So amazing! Such amazement!")

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
    fill_in "Review", with: review.review
    click_on "Create Review"

    expect(page).to have_content "Review was successfully created"

    visit root_path
    click_on book.title

    click_on "Review book"
    fill_in "Review", with: second_review.review
    click_on "Create Review"

    expect(page).to have_content "Review was successfully created"
    click_on book.title
    (second_review.review).should appear_before(review.review)
  end

  scenario "User reads reviews" do
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

    click_on "Review book"
    fill_in "Review", with: review.review
    click_on "Create Review"
    visit root_path
    click_on book.title

    expect(page).to have_content "Candidate"
  end

end
