class Book < ActiveRecord::Base

has_many :reviews
belongs_to :user

validates :title, length: { minimum: 2 }
validates :description, length: { minimum: 50 }
validates :url, presence: true
validates :url, :format => URI::regexp(%w(http https))
end
