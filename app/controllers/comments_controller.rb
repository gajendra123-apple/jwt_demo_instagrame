class CommentsController < ApplicationController
    before_action :authenticate_user, only: [:create, :index, :create_reply]
   before_action :find_user,only: [:show,:update, :destroy]
    def create
    	@comment=Comment.create(
            text: params[:text], post_id: params[:post_id],
            user_id: @current_user.id, attch: params[:attch]) 
        if  @comment.save
    	      render json: CommentSerializer.new(@comment).as_json, status:201
    	 else
    		  render json: {erors: @comment.errors.full_messages}, status:  503
    	end
    end
      def create reply
        @comment = Comment.find_by(id:params[:id])
       @reply=@comment.replies.create(text: params[:text], user_id: @current_user.id)
      
        if @reply.present   

         render json: @reply, status:201
         else
          render json: {erors: @reply.errors.full_messages}, status:  503
        end
    end

    def index
      @comment = Comment.all
      @comment = @comment.where(post_id: params[:post_id]) if params[:post_id].present?
      render json: @comment
    end


    #def show_reply
   #  @comment = Comment.find_by(id:params[:id])
     #@replies = @comment.replies
    #end

     
    def show
      @comment = Comment.find_by(id:params[:id])
      if @comment.present?
        render json: @comment, status:200
      else
        render json: {message: "user with ID #{params[:id]} not found" }, status: 404
      end
    end
     
      def update
    	unless @comment.update(comment_params)
    		render json: {erors: @comment.errors.full_message}
    	end
    end

      def destroy
      	@comment.destroy
      end

    private

    def find_user
      byebug
      @comment= Comment.find(params[:id])
    end

     def comment_params
    	  params.permit(:text)
    end
end
