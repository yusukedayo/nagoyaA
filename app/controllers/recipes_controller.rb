class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show; end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path, success: 'レシピを作成しました'
    else
      flash.now[:success] = '入力内容を見直してください'
      render :new
    end
  end

  def edit; end

  def destroy; end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image)
  end
end
