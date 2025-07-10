class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :articles

  has_many :likes
  has_many :liked_articles, through: :likes, source: :article


  validates :username, uniqueness: true, presence: true
end
