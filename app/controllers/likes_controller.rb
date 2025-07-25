class LikesController < ApplicationController
  before_action :authenticate_user!


  # find the profile and the article
  #
  def create
    article_id = params[:article_id]
    profile_id = params[:profile_id]

    article = Like.find_article_under_profile(profile_id, article_id)

    if article.present?
      Like.create_like(profile_id, article_id)
      redirect_to profile_feeds_path
    else
      redirect_to profile_path
    end
  end

private

  def set_profile
    @profile = current_user.profile
  end

  # def likes_params
  #   params.require(:likes).permit(:profile_id, :article_id)
  # end
end
