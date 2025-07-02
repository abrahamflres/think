class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :article


  def self.create_like(profile_id, article_id)
    create(profile_id: profile_id, article_id: article_id)
  end

  def self.find_article_under_profile(profile_id, article_id)
    Article.find_by(profile_id: profile_id, id: article_id)
  end
end
