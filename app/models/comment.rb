class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :reciepe

  # validates
  validates :content, presence: true, length: { miximum: 400 }
end
