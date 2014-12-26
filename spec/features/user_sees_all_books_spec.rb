require "rails_helper"

feature "User sees all books", %q(
  As a user
  I want to view recently posted books
  So that I can see what others are reading

  Acceptance Criteria

  [ ] I must see the title of each book
  [ ] I must see the description of each book
  [ ] I must see the URL of each book
  [ ] I must see books listed in order, most recently posted first
  [ ] I must see if a book was posted by an astronaut or a candidate
) do

feature "User sees all the books" do

  book = FactoryGirl.build(:book)

  visit root_path

  expect(page).to have_content "#{book.title}"
  expect(page).to have_content "#{book.author}"
  expect(page).to have_content "#{book.description}"
  expect(page).to have_content "#{book.url}"
  expect(page).to have_content "#{book.user.role}"
  end
end
