class Topic < ApplicationRecord
  has_many :articles

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  def self.fetch_topics
    topic = Topic.all
    topic
  end
end
