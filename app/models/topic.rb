class Topic < ApplicationRecord
  has_many :articles

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  has_one_attached :image

  def self.fetch_topics
    topics = Topic.all
    topics
  end

  def self.fetch_topic(topic_id)
    topic = Topic.find(topic_id)
    topic
  end


  # TODO: form is passing nil
  def self.update_topic(topic_id, topic_params)
    topic = find(topic_id)
    topic.update(topic_params)
    topic
  end

  def self.initialize_topic
    topic = Topic.new
    topic
  end
end
