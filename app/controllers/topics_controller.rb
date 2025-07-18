class TopicsController < ApplicationController
  def index
    @topics = Topic.fetch_topics()
  end

  def show
    topic_id = params[:id]
    @topic = Topic.fetch_topic(topic_id)
  end
  def edit
    topic_id = params[:id]
    @topic = Topic.fetch_topic(topic_id)
  end

  def update
    topic_id = params[:id]
    @topic = Topic.update_topic(topic_id, topic_params)
    if @topic.errors.empty?
      redirect_to topics_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def new
    @topic = Topic.initialize_topic
  end
private
  def topic_params
    params.require(:topic).permit(:title, :body, :image)
  end
end
