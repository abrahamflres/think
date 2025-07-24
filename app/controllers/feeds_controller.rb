class FeedsController < ApplicationController
  before_action :set_profile

  def index
    @profile = current_user.profile
    @feed_articles = Article.where(topic_id: @profile.topics.pluck(:id))
  end

private
  def set_profile
    @profile = current_user.profile
  end
end
