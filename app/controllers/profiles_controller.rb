class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :edit, :update ]
  def index
    @q = Profile.ransack(params[:q])
    @searched_profile = @q.result

    @profile = current_user.profile
    if @profile.topic != nil
      @filtered_profiles = Profile.where(topic_id: @profile.topic.id).where.not(id: @profile.id)
    else
      flash[:notice] = "Choose a topic first"
      redirect_to topics_path
    end

    # bug upabove
    @profiles = Profile.all().where.not(id: @profile.id)
  end

  def show
    @profile = Profile.find(params[:id])
    @articles = @profile.articles.order(created_at: :desc)
    @current_profile = current_user.profile

    @engagement_data = @profile.engagements.group(:activity_date).count.transform_keys { |date| date.to_time.to_i * 1000 }

    @following_count = @profile.followees.count
    @follower_count = @profile.followers.count
  end

  def new
    @profile = current_user.build_profile
    @topics = Topic.all.order(:title)
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
    @topics = Topic.all.order(:title)
  end

  def streak
    @profile = current_user.profile
    @profile.streak += 1


    if @profile.save
      redirect_to profiles_path
    else
      redirect_to profile_feeds_path, status: :unprocessable_entity
    end
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
    params.require(:profile).permit(:username, :firstname, :lastname, :bio, :image, :topic_id)
  end

  def set_profile
    @profile = Profile.find(params[:id])

    if @profile == current_user.profile
      profiles_path
    else
      flash[:alert] = "Must sign in"
      redirect_to root_path
    end
  end
end
