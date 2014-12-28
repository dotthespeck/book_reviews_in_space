require 'rails_helper'

feature "User can delete a book", %q(
  As a user
  I want to delete a book I posted
  So that I can delete a book I posted for any reason

  Acceptance Criteria

  [] I must be able delete a book from the book details page
  [] All reviews associated with the book must also be deleted
) do

scenario "User can delete a book" do

  user = FactoryGirl.build(:user)
  book = FactoryGirl.build(:book)

  visit root_path
  click_on "Sign up"

  fill_in "First Name", with: user.first_name
  fill_in "Last Name", with: user.last_name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_on "Register"

  visit root_path
  click_on "Add a book"
  fill_in "Title", with: book.title
  fill_in "Author", with: book.author
  fill_in "Description", with: book.description
  fill_in "url", with: book.url
  click_on "Create Book"

  expect(page).to have_content "Book was successfully created"

  click_on book.title
  click_on "Delete"
  end

end
