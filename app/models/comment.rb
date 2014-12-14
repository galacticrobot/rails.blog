class Comment < ActiveRecord::Base
  belongs_to :post #asociates comments with post
end
