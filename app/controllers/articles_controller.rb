class ArticlesController < ApplicationController
  before_action :check_current_user,only:[:new,:create,:edit,:update,:destroy]

  def index
    @articles = Article.page(params[:page]).per(6)
    respond_to do |format|
      if params[:search].present?
        format.js{
          @articles = Article.where("title like ? or content like ?","%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).per(6)
        }
        format.html
      else
        format.html
      end
    end
  end

  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find_by_id(params[:id])
    @comments = @article.comments.order("id desc")
    @comment = Comment.new
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def update 
    @article = Article.find_by_id(params[:id])
    if @article.update(params_article)
      flash[:success] = "Success Update Records"
      redirect_to action:'index'
    else 
      flash[:error] = "data not valid"
      render'edit'
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    if @article.destroy
      flash[:success] = "Success Delete Records"
      redirect_to action: "index"
    else
      flash[:error] ="Failed Delete"
      redirect_to action: "index"
    end
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      flash[:success] = "Success Add Records"
      redirect_to action: 'index'
    else
      flash[:error] = "Data not valid"
      render 'new'
    end
  end

  private
  def params_article
    params.require(:article).permit(:title, :content, :status)
  end
end