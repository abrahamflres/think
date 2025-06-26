class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :articles


  validates :username, uniqueness: true, presence: true
end
