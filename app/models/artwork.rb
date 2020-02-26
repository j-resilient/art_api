class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title, 
        message: "can only have one art with that name" }
    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
end