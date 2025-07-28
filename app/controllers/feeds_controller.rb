class FeedsController < ApplicationController
  before_action :set_profile

  def index
    @profile = current_user.profile
    @feed_articles = Article.where(topic_id: @profile.topics.pluck(:id))
  end

  def new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @feed = @profile.feeds.build(topic: @topic)
    @profile = current_user.profile

    if @feed.save
      redirect_to profile_feeds_path
    else
      redirect_to root_path, status: :unprocessble_entity
    end
  end

private
  def set_profile
    @profile = current_user.profile
  end
end
