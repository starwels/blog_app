class ArticlesController < ApplicationController
  def index
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to articles_path, notice: "Article has been created"
    else
      flash.now[:alert] = "Article has not been created"
      render new_article_path
  	end
  end

  private

	def article_params
  	params.require(:article).permit(:title, :body)
  end  
end
