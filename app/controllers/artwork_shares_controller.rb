class ArtworkSharesController < ApplicationController
    def create
        share = ArtworkShare.new(artwork_shares_params)
        if share.save
            render json: share
        else
            render json: share.errors.full_message, status: :unprocessable_entity
            
        end
    end

    def destroy
        share = ArtworkShare.find_by(id: params[:id])
        if share.destroy
            render json: share
        else
            render json: 'Error: cannot unshare this artwork'
        end
    end

    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id, :id)
    end
end