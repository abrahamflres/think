class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    profile_id = params[:profile_id]
    article_id = params[:article_id]

    article = Like.find_article_under_profile(profile_id, article_id)

    if article.present?
      like = Like.create(profile_id: profile_id, article_id: article_id)

      unless like.persisted?
        puts "❌ Like failed to save:"
        puts like.errors.full_messages.inspect
      end

      redirect_to profiles_path
    else
      redirect_to root_path
    end
  end



# find the profile and the article
private

  def set_profile
    @profile = current_user.profile
  end

  # def likes_params
  #   params.require(:likes).permit(:profile_id, :article_id)
  # end
end
