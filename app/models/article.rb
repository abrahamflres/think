class Article < ApplicationRecord
  belongs_to :profile


  validates :title, :body, presence: true
end
