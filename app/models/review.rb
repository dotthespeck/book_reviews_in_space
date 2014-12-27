class Review < ActiveRecord::Base

  belongs_to :book
  belongs_to :user

  validates :review, length: { minimum: 50 }
end
