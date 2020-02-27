class Comment < ApplicationRecord
    validates :author_id, :artwork_id, :body, presence: true
end