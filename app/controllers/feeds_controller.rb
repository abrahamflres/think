class FeedsController < ApplicationController
  before_action :set_profile
  # TODO: get the feed to take a filtered and a default feed
  def index
    @profile = current_user.profile
    @topics = @profile.topics

    @chosen_topic = params[:topic_id]

    if params[:topic_id].present?
      @filtered_articles = Article.where(topic_id: params[:topic_id]).order(created_at: :desc)
    else
      @feed_articles = Article.where(topic_id: @profile.topics.pluck(:id)).order(created_at: :desc)
    end
  end

  def show
    @profile = current_user.profile
    @topic = params[:topic_id]

    if @topic.present?
      @feed_articles_filtered = Article.where(topic_id: @topic).order(created_at: :desc)
    else
      @feed_articles = Article.where(topic_id: @profile.topics.pluck(:id)).order(created_at: :desc)
    end
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
