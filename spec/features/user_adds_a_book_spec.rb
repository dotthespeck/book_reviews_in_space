require "rails_helper"

feature "user adds a book", %q(

   As a user
   I want to post a link to a book
   So I can share what I'm reading with others

   Acceptance Criteria

  [x] I must provide a title that is at least 1 character long
  [x] I must provide a description that is at least 10 characters long
  [x] I must provide a valid URL to the book
  [x] I must be presented with errors if I fill out the form incorrectly
) do

 scenario "User adds a book" do

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
  end

scenario "User adds a book that does not meet the requirements" do


  user = FactoryGirl.build(:user)

  book = Book.new(
  title: "n",
  author: "Louisa May Alcott",
  description: "Good",
  url: "anurl"
  )
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

  expect(page).to have_content "Title is too short"
  expect(page).to have_content "Description is too short"
  expect(page).to have_content "Url is invalid"
  end
end
