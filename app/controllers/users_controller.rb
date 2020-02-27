class UsersController < ApplicationController
    def index
        if params.has_key?(:query)
            # where username includes query string at any point but in the same order
            render json: User.where("username LIKE ?", "%#{params[:query]}%")
        else
            render json: User.all
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def show
        user = User.find_by(id: params[:id])
        user.nil? ? (render json: 'Error: no such user.') : (render json: user)
    end

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.destroy
            render json: user
        else
            render json: 'Error: cannot destroy user'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :query)
    end
end