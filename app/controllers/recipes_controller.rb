class RecipesController < ApplicationController
  def index
  end

  def new
    @reciepe = Recipe.new
  end

  def show; end

  def create
    @reciepe = Recipe.new(reciepe_params)
    if @reciepe.save
      redirect_to root_path, success: 'レシピを作成しました'
    else
      flash.now[:success] = '入力内容を見直してください'
      render :new
    end
  end

  def edit; end

  def destroy; end

  private

  def reciepe_params
    params.require(:reciepe).permit(:title, :content, :image)
  end
end
