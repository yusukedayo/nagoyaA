class LikesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.like(recipe)
    redirect_back fallback_location: root_path, flash[:success] = 'いいねしました'
  end

  def destroy
    recipe = current_user.bookmarks.find(params[:id]).recipe
    current_user.unlike(recipe)
    redirect_back fallback_location: root_path, flash[:success] = 'いいねを取り消しました'
  end
end
