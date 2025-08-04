class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :article

  validates :profile_id, uniqueness: { scope: :article_id }



  # create two functions called create like and find artile under profile
  #
  def self.find_artic4le_under_profile(profile_id, article_id)
    Article.find_by(profile_id: profile_id, id: article_id)
  end

  def self.create_like(profile_id, article_id)
    create(profile_id: profile_id, article_id: article_id)
  end
end
