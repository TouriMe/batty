class CommentsController < ApplicationController
  before_action do
    comment = comment_params
    @target = comment[:commentable_type].constantize.find(comment[:commentable_id])
  end

  def create
    @comment = @target.comments.new(comment_params)
    @comment.normal_user = current_normal_user
    @comment.save
    render 'response'
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :rating, :commentable_id, :commentable_type)
  end
end