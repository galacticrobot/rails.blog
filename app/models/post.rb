class Post < ActiveRecord::Base
    #makes sure there is at least 5 char in title and content in title and body
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true
end
