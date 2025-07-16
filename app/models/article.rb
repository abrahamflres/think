class Article < ApplicationRecord
  belongs_to :profile
  has_one_attached :image

  has_many :likes
  has_many :liked_profiles, through: :likes, source: :profile



  belongs_to :topic

  DIFFICULTY = %w[easy medium hard none]

  validates :title, :body, :difficulty, presence: true

  def likes_count
    likes.count
  end

  def self.select_difficulty
    %w[easy medium hard none]
  end
end
