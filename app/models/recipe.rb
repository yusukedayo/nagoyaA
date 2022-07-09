class Recipe < ApplicationRecord
  belongs_to :user

  # validates
  validates :title, presence: true, lenght: { maximum: 250 }
  validates :content, presence: true, length: { miximum: 1_000 }

end
