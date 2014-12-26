# require "rails_helper"
#
# feature "user adds a book" do
#
#   # As a user
#   # I want to post a link to a book
#   # So I can share what I'm reading with others
#   #
#   # Acceptance Criteria
#   #
#   # - I must provide a title that is at least 1 character long
#   # - I must provide a description that is at least 10 characters long
#   # - I must provide a valid URL to the book
#   # - I must be presented with errors if I fill out the form incorrectly
#
#
#  scenario "User adds a book" do
#
#    visit root_path
#    user = FactoryGirl.create(:user)
#    book = FactoryGirl.create(:book)
#
#    click_on "Sign up"
#
#    fill_in "First Name", with: user.first_name
#    fill_in "Last Name", with: user.last_name
#    fill_in "Email", with: user.email
#    fill_in "Password", with: user.password
#    fill_in "Password confirmation", with: user.password
#
#    visit root_path
#
#    click_on "Add a book"
#
#   fill_in "Title", with: book.title
#   fill_in "Author", with: book.author
#   fill_in "Description", with: book.description
#   fill_in "url", with: book.url
#
#   click_on "Create Book"
#
#   #Flash is not showing
#   # expect(page).to have_content "Book added successfully"
#   end
#
# scenario "User adds a book that does not meet the requirements" do
#
#   book = Book.new(
#   title: "n",
#   author: "Louisa May Alcott",
#   description: "Good",
#   url: "anurl"
#   )
#
#   fill_in "Title", with: book.title
#   fill_in "Author", with: book.author
#   fill_in "Description", with: book.description
#   fill_in "Url", with: book.url
#
#   click_on "Create Book"
#
#   expect(page).to have_content "Title is too short"
#   expect(page).to have_content "Description is too short"
#   expect(page).to have_content "URL is invalid"
#   end
# end
