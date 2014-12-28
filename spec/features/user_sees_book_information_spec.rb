require 'rails_helper'

feature 'User sees information' do
  #  %q(
  # As a user
  # I want to view a book's details
  # So that I can see a book's details
  #
  # Acceptance Criteria
  #
  # [x] I must be able to get to this page from the books index
  # [x] I must see the book's title
  # [x] I must see the book's description
  # [x] I must see the book's URL
  # )

scenario 'User clicks on book' do

  books = FactoryGirl.create_list(:book, 3)
  books.each do |book|

    visit root_path
    click_on book.title

    expect(page).to have_content book.title
    expect(page).to have_content book.author
    expect(page).to have_content book.description
    expect(page).to have_content book.url
    end
  end
end
