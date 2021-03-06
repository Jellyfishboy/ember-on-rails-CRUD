class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def show
        render json: User.find(params[:id])
    end

    def create
      user = User.new(user_params)

      if user.save
        render json: user
      else
        render json: user, status: 422
      end
    end

    def update
      user = User.find(params[:id])

      if user.update_attributes(user_params)
        render json: user
      else
        render json: user, status: 422
      end
    end

    def destroy
      user = User.find(params[:id])
      if user.destroy
        render json: user, status: 204
      else
        render json: user
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :last_name, :quote)
    end

end