class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @profile = current_user.profile
  end
  def new
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

private
  def profile_params
    params.require(:profile).permit(:username, :firstname, :lastname, :bio)
  end
end
