class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :username, uniqueness: true, presence: true
end
