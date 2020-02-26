class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :artwork_id, uniqueness: {
        scope: :viewer_id,
        message: 'art can only be shared with this user once'
    }

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User

    belongs_to :art,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork
end