class Topic < ApplicationRecord
  has_many :articles

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  def self.fetch_topics
    topics = Topic.all
    topics
  end

  def self.fetch_topic(topic_id)
    topic = Topic.find(topic_id)
    topic
  end
end
