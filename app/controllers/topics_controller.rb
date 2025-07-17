class TopicsController < ApplicationController
  def index
    @topics = Topic.fetch_topics()
  end

  def show
  end
end
