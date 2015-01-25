class ArticlesController < ApplicationController
  before_action :article_params, only: [:create, :update]

  def index
    @articles = Article.all
  end

  def new
    @article= Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    @article.save
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
