class CommentsController < ApplicationController
    # create, destroy
    def index
        if comment_params.has_key?(:user_id)
            user = User.find_by(id: comment_params[:user_id])
            render json: user.comments
        elsif comment_params.has_key?(:artwork_id)
            art = Artwork.find_by(id: comment_params[:artwork_id])
            render json: art.comments
        else
            render json: 'No comments.'
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_message, status: :unprocessable_entity
        end
    end
    
    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment.destroy
            render json: comment
        else
            render json: 'Error: cannot delete comment.'
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body, :user_id)
    end
end