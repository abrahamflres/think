class ArticlesController < ApplicationController
  before_action :set_profile


  def show
    @article = @profile.articles.find(params[:id])
  end

  def new
    @article = @profile.articles.new
  end

  def create
    @article = Article.new(article_params)
    @article.profile = @profile



    if @article.save
      redirect_to profiles_path
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
    @profile = Profile.find(params[:profile_id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, :difficulty)
  end
end
