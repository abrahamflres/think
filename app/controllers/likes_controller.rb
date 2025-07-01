class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
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
