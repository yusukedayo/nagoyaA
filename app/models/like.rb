class Like < ApplicationRecord
  belongs_to :user
  belongs_to :reciepe

  validates :user_id, uniqueness: { scope: :recipe_id }
end
