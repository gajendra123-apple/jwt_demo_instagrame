class LikesController < ApplicationController
      before_action :authenticate_user, only: [:create, :index]
      before_action :find_user,only: [:show,:update, :destroy]

	 def create
    	@like=Like.create(
            likes: params[:likes], post_id: params[:post_id],
            comment_id: params[:comment_id],user_id: @current_user.id) 
        if  @like.save
    	      render json: @like, status:201
    	 else
    		  render json: {erors: @like.errors.full_messages}, status:  503
    	end
    end
     
      def index
      @like = Like.all
      render json: @like
    end

       def show
      @like = Like.find_by(id:params[:id])
      if @like.present?
        render json: @like, status:200
      else
        render json: {message: "user with ID #{params[:id]} not found" }, status: 404
      end
    end

    def destroy
      @like.destroy
    end
    
    def update
    	unless @like.update(like_params)
        render json: {erors: @like.errors.full_message}
      end
    end

    private

    def find_user
      @like= Like.find(params[:id])
    end

    def like_params
    	  params.permit(:likes)
    end
end
