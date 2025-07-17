class TopicsController < ApplicationController
  def index
    @topics = Topic.fetch_topics()
  end

  def show
    topic_id = params[:id]

    @topic = Topic.fetch_topic(topic_id)
  end
end
