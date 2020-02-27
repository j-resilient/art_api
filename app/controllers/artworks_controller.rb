class ArtworksController < ApplicationController
    def index
        user = User.find_by(id: params[:user_id])
        render json: (user.artworks + user.shared_artworks)
    end

    def create
        art = Artwork.new(artwork_params)
        if art.save
            render json: art
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        art = Artwork.find_by(id: params[:id])
        art.nil? ? (render json: 'Error: no such artwork.') : (render json: art)
    end

    def update
        art = Artwork.find_by(id: params[:id])
        if art.update(artwork_params)
            render json: art
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        art = Artwork.find_by(id: params[:id])
        if art.destroy
            render json: art
        else
            render json: 'Error: cannot destroy art'
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end