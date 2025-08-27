class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :articles

  has_many :likes
  has_many :liked_articles, through: :likes, source: :article

  has_many :feeds
  has_many :topics, through: :feeds

  has_many :comments

  has_many :engagements, dependent: :destroy

  belongs_to :topic

  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :given_follows, source: :followee

  has_many :recieved_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :recieved_follows, source: :follower


  validates :username, uniqueness: true, presence: true



  def self.ransackable_attributes(auth_object = nil)
    [ "username" ]
  end
end
