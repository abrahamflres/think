class Feed < ApplicationRecord
  belongs_to :profile
  belongs_to :topic
end
