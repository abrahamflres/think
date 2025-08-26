class Follow < ApplicationRecord
  belongs_to :followee, class_name: "Profile"
  belongs_to :follower, class_name: "Profile"

  validates :followee_id, :follower_id, presence: true

  validates :follower_id, uniqueness: { scope: :followee_id }

  validate :cannot_follow_self

  def cannot_follow_self
    if follower_id == followee_id
      errors.add(:followee_id, "cannot follow self")
    end
  end
end
