class Topic < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, uniqueness: true


  def self.list_topics
    Topic.all
  end
end
