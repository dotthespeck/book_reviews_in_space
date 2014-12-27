require 'rails_helper'

feature "user reviews a book", %q(
  As a user
  I want to review a book
  So I can let other users know what I thought about it

Acceptance Criteria

  [] I must be on the book detail page
  [] I must provide a description that is at least 50 characters long
  [] I must be presented with errors if I fill out the form incorrectly
) do

before do
  user = FactoryGirl.build(:user)
  book = FactoryGirl.build(:book)
end

end
