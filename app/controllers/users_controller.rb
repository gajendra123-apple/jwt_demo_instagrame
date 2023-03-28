class UsersController < ApplicationController
   skip_before_action :authenticate_user, only: [:create, :index]
   before_action :find_user,only: [:show,:update, :destroy]

    def create
    	@user = User.new(user_params)
      if  @user.save
    	    render json: {user: @user}, status:201
    	else
    		  render json: {erors: user.errors.full_messages}, status:  503
      end
    end 

    def index
      users = User.all
      render json: UserSerializer.new(users)
    end

    def show
      @user = User.find_by(id: params[:id])
      if @user.present?
        render json: @user, status:200
      else
        render json: {message: "user with ID #{params[:id]} not found" }, status: 404
      end
    end

    def update
      unless @user.update(user_params)
        render json: {erors: @user.errors.full_message}
      end
    end

    def destroy
      @user.destroy
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:user_name, :name,  :email, :password, :profile)
    end

end






