class Article < ApplicationRecord
  belongs_to :profile
  has_one_attached :image


  validates :title, :body, presence: true
end
