require "rails_helper"

feature "User sees all books", %q(
  As a user
  I want to view recently posted books
  So that I can see what others are reading

  Acceptance Criteria

  [x] I must see the title of each book
  [x] I must see the description of each book
  [x] I must see the URL of each book
  [x] I must see books listed in order, most recently posted first
  [x] I must see if a book was posted by an astronaut or a candidate
) do

  scenario "User sees all the books" do

    books = FactoryGirl.create_list(:book, 3)
    books.each do |book|

    visit root_path

    expect(page).to have_content "#{book.title}"
    expect(page).to have_content "#{book.author}"
    expect(page).to have_content "#{book.description}"
    expect(page).to have_content "#{book.url}"
    expect(page).to have_content "Candidate"
    end
  end

  scenario "Most recent posted first" do

    book = FactoryGirl.create(:book)
    second_book = FactoryGirl.create(:book)

    visit root_path
    (second_book.title).should appear_before(book.title)

  end
end
