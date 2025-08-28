class FollowsController < ApplicationController
  before_action :set_profile, only: [ :destroy, :create ]
  def index
    # return followers
    @followers = @profile.followers
    # return profile's that follow you
    @followees = @profile.followees
  end

  def edit
  end

  def update
  end

  def new
    @follow = @profile.follows.new
  end

  def create
    @followee = Profile.find(params[:followee_id])

    @follow = @profile.given_follows.build(followee: @followee)

    if @follow.save
      flash[:notice] = "Follow Sucessful"
      redirect_to profile_path(@profile.id)
    else
      flash[:alert] = "Cannot follow"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = @profile.given_follows.find(params[:id])
    flash[:alert] = "Unfollowed"
    @follow.destroy!
  end
private
  def set_profile
    @profile = current_user.profile
  end
end
