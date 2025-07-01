class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :articles

  has_many :likes
  has_many :articles, through: :likes


  validates :username, uniqueness: true, presence: true
end
