class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @articles = Article.all
    render json: { articles: @articles.as_json}
  end

  def show
    @article = Article.find(params[:id])
    render json: {article: @article.as_json}
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    render json: {title: @article.title, description: @article.description, id: @article.id}
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  private

    def article_params
      params.permit(:title, :description)
    end
end
