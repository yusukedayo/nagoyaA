class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end