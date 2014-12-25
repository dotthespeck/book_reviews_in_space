require "rails_helper"

feature "user adds a book" do

  # As a user
  # I want to post a link to a book
  # So I can share what I'm reading with others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 1 character long
  # - I must provide a description that is at least 10 characters long
  # - I must provide a valid URL to the book
  # - I must be presented with errors if I fill out the form incorrectly

scenario "User adds a book" do
book = Book.create(
title: "Little Women",
author: "Louisa May Alcott",
description: "The tale of four sisters growing up in Concord, MA",
url: "http://www.gutenberg.org/ebooks/514"
)

  visit root_path
  click_on "Add a book"

  fill_in "Title", with: book.title
  fill_in "Author", with: book.author
  fill_in "Description", with: book.description
  fill_in "book_url", with: book.url

  click_on "Create Book"

  expect(page).to have_content "Book added successfully"
  end
end
