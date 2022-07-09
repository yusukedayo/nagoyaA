class CommentsController < ApplicationController
  before_action :comment_set, only: %i[edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to reciepe_path(comment.reciepe), success: 'コメント作成しました'
    else
      redirect_to reciepe_path(comment.reciepe), danger: 'コメント作成に失敗しました'
    end
  end

  def edit; end

  def update
    return unless @comment.update!(comment_params)

    redirect_to root_path, success: 'コメント更新しました'
  end

  def destroy
    @comment.destroy!
    redirect_to root_path, success: 'コメントを削除しました'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(reciepe_id: params[:reciepe_id])
  end
end
