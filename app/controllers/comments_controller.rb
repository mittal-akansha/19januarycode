class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @user_post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user_post), notice: 'Comment has been created'
    else
      redirect_to user_post_path(@user_post), alert: 'Comment has not been created'
    end
  end

  def destroy
    @comment = @user_post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user_post)
  end

  # def update
  #   @comment = @user_post.comments.find(params[:id])

  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to user_post_url(@post), notice: 'Comment has been updated' }
  #     else
  #       format.html { redirect_to user_post_url(@post), alert: 'Comment was not updated!' }
  #     end
  #   end
  # end

  private

  def set_post
    @user_post = UserPost.find(params[:user_post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
