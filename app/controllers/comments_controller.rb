class CommentsController < ApplicationController
  before_action :set_profile
  def new
    @article = Article.find(params[:article_id])
    @profile = current_user.profile


    @comment = Comment.new(profile_id: @profile, article_id: @article)
  end

def create
  @profile = current_user.profile
  @article = Article.find(params[:article_id])

  @comment = Comment.new(comment_params)
  @comment.profile = @profile
  @comment.article = @article

  if @comment.save
    redirect_to profile_feeds_path, notice: "Comment added!"
  else
    render :new, status: :unprocessable_entity
  end
end


private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_profile
    @profile = current_user.profile
  end
end
