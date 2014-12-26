class Book < ActiveRecord::Base

has_many :reviews
belongs_to :user

validates :title, length: { minimum: 2 }
validates :description, length: { minimum: 50 }
end
