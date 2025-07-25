class FeedsController < ApplicationController
  before_action :set_profile

  def index
    @profile = current_user.profile
    @feed_articles = Article.where(topic_id: @profile.topics.pluck(:id))
  end

  def new
    @feed = @profile.topic.feed.new
  end

  def create
  end

private
  def set_profile
    @profile = current_user.profile
  end
end
