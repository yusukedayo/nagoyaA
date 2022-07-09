class Recipe < ApplicationRecord
  belongs_to :user

  # validates
  validates :title, presence: true, length: { maximum: 250 }
  validates :content, presence: true, length: { maximum: 1_000 }

end
