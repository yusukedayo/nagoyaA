class User < ApplicationRecord
  authenticates_with_sorcery!

  # いいね機能 ここから
  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe

  def like(recipe)
    like_recipes << recipe
  end

  def unlike(recipe)
    like_recipes.destroy(recipe)
  end

  def like?(recipe)
    like_recipes.include?(recipe)
  end
  #ここまで
end
