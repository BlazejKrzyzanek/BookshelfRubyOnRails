class CommentsController < ApplicationController
    def create
      book = Book.find params[:book_id]
      comment = book.comments.new comment_params
      comment.save
      flash[:notice] = 'Comment saved'
      redirect_to book_path(book)
    end
  
    private
      # Using a private method to encapsulate the permissible parameters
      # is just a good pattern since you'll be able to reuse the same
      # permit list between create and update. Also, you can specialize
      # this method with per-user checking of permissible attributes.
      def comment_params
        params.require(:comment).permit(:author, :text)
      end
  end