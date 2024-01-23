class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user_post
  has_rich_text :body
end
