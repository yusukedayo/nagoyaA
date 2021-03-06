class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show; end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to root_path, success: 'レシピを作成しました'
    else
      flash.now[:error] = '入力内容を見直してください'
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update
      redirect_to root_path, success: 'レシピを更新しました'
    else
      flash.now[:error] = '入力内容を見直してください'
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path, success: 'レシピを削除しました'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image)
  end
end
