class EngagementsController < ApplicationController
  before_action :set_profile
  def create
    @profile = current_user.profile
    @engagement = Engagement.new(activity: "read", activity_date: Date.today)

    @engagement.profile = @profile


    if @engagement.save
      flash[:notice] = "Sucessful"
      redirect_to profiles_path
    else
      flash[:alert] = "Unsucessful"
      redirect_to profile_feeds_path
    end
  end

private
  def set_profile
    @profile = current_user.profile
  end

  def engagement_params
    params.require(:engagement).permit(:activity, :activity_date, :profile_id)
  end
end
