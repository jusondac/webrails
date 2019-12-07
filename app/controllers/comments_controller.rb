class CommentsController < ApplicationController
	def show
    @comments = Comment.find_by_id(params[:id])
  end

  def create
  	@comment = Comment.new(params_comment)
  	if @comment.save
    		flash[:success] = "Success Add Records"
    		redirect_to action: 'index'
  	else
    		flash[:error] = "Data not valid"
    		render 'new'
  	end
 end

  private
  def params_comment
    params.require(:comment).permit(:article_id, :user_id, :comment, :status)
  end
end
