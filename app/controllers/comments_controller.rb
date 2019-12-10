class CommentsController < ApplicationController
  # before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]

	def destroy
    @comments = Comment.find_by_id(params[:id])
    if @comment.destroy
      flash[:notice] = "success"
      redirect_back fallback_location: "0.0.0.0:3000/articles"
    else
      flash[:notice] = "fails"
      redirect_back fallback_location: "0.0.0.0:3000/articles"
    end
  end

  def create
    respond_to do |format|
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(params_comment)
      if @comment.save
        format.js { @article }
        redirect_back fallback_location: "0.0.0.0:3000/articles"
      else
        format.js { @article = Article.find(params[:article_id]) }
        render 'new'
      end
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:article_id, :user_id, :comment, :status)
  end
end
