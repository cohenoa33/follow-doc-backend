class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments
          end
    
      def show
        @comment = Comment.find_by(id: params[:id])
        if @comment
          render json: @comment
        else
          render json: { message: 'This ID does not exist' }
        end
      end
    
      def create
        @comment = Comment.create(comment_params)
        if @comment.valid?
          render json: @comment
    
        else
          render json: { error: 'failed to add new Comment' }, status: :not_acceptable
        end
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:text, :problem_id, :status_open)
      end
end
