FactoryGirl.define do

  factory :user do
    first_name "Marlon"
    last_name "Snugglebunny"
    sequence :email do |n|
      "marlon#{n}@thedog.com"
    end
    role "Candidate"
    password "marlonthedog"
  end

  factory :book do
  sequence :title do |n|
    "#{n}Little Women"
  end
  author "Louisa May Alcott"
  description "Story of four women growing up in Concord, MA. Classic novel"
  url "http://www.littlewomen.com"

  user
  end

end
