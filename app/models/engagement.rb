class Engagement < ApplicationRecord
  belongs_to :profile
  validates :activity, :activity_date, presence: true
end
