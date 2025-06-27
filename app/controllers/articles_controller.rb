class ArticlesController < ApplicationController
  before_action :set_profile
  def index
    @profile = Profile.find(params[:id])
  end

  def show
    @article = @profile.articles.find(params[:id])
  end

  def new
    @article = @profile.articles.new
  end

  def create
    @article = @profile.articles.new(article_params)

    if @article.save
      redirect_to profile_articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = @profile.articles.find(params[:id])
  end

  def update
    @article = @profile.articles.find(params[:id])


    if @article.update(article_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = @profile.articles.find(params[:id])
    @article.destroy

    redirect_to profile_path
  end
private
  def set_profile
    @profile = current_user.profile
  end

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end
