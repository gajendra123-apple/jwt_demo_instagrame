class PostsController < ApplicationController
   before_action :authenticate_user, only: [:create, :index]
    before_action :find_post,only: [:show,:update, :destroy]

   def create
    	@post=Post.create(
            profile: params[:profile],attchment: params[:attchment], 
            user_id: @current_user.id)
         
        if  @post.save
    	      render json: PostSerializer.new(@post).as_json, status: 201
    	 else
    		  render json: {erors: @post.errors.full_messages}, status:  503
    	end
    end

    def show
      @post = Post.find_by(id: params[:id])
      if @post.present?
            render json: PostSerializer.new(@post).as_json, status:200
      else
         render json: {message: "post with ID #{params[:id]} not found" }, status: 404
      end
    end

    def update
    	unless @post.update(post_params)
    		render json: {erors: @post.errors.full_message}
    	end
    end

    def destroy
      @post.destroy
    end
      
    def index
      @post = Post.all
      render json: @post
   end


   private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
    	  params.permit(:attchment)
    end

end