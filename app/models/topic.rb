class Topic < ApplicationRecord
  has_many :articles, through: :article_topics
  has_many :article_topics

  validates :title, :description, presence: true
  validates :title, uniqueness: true
end
