class EngagementsController < ApplicationController
  before_action :set_profile
  def create
    @profile = current_user.profile
    @engagement.profile = @profile
  end

private
  def set_profile
    @profile = current_user.profile
  end

  def engagement_params
    params.require(:engagement).permit(:activity, :activity_date, :profile_id)
  end
end
