class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :article


  # each comment does not need a reply: optional : true
  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: :parent_id

  validates :body, presence: true
end
