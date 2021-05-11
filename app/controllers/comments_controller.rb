
class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      if user_signed_in?
        @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
      else
        @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end
   
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
   
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
end