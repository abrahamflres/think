class Article < ApplicationRecord
  belongs_to :profile
  has_one_attached :image

  has_many :likes
  has_many :profiles, through: :likes


  validates :title, :body, presence: true


  def likes_count
    likes.count
  end
end
