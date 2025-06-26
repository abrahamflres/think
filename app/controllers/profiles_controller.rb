class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @profile = current_user.profile
    @articles = current_user.profile.articles
  end

  def new
    @profile = current_user.build_profile
  end
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profiles_path
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:profile).permit(:username, :firstname, :lastname, :bio, :image)
  end
end
