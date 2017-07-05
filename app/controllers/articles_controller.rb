class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh",
                              password: "secret",
                              except: [:index, :show]
  before_action :authenticate_user!

  def index
    @articles = Article.all.select{|x| x.is_public == true || x.user == current_user}
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
      flash[:success] = "Article was created successful"
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
      flash[:success] = "Article was updated successful"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:success] = "Article was deleted"
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :is_public, :user_id)
    end

end
