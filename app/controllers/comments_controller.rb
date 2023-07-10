class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    return unless @comment.save

    redirect_to item_path(params[:item_id]) + '#comments'
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      flash[:notice] = 'コメントが削除されました。'
    else
      flash[:alert] = 'コメントの削除に失敗しました。'
    end
    redirect_to item_path(@comment.item)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
