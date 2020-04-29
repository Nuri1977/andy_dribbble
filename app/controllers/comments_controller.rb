class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @shot = Shot.find(params[:shot_id])
    @comment = Comment.create(comments_params)
    @comment.shot_id = @shot.id
    @comment.user_id = current_user.id if current_user
    @comment.save!

    redirect_to shot_path(@shot)
  end

  def destroy
    @shot = Shot.find(params[:shot_id])
    @comment = @shot.comments.find(params[:id])
    @comment.destroy

    redirect_to shot_path(@shot)
  end

  private

  def comments_params
    params.require(:comment).permit(:response)
  end

end
