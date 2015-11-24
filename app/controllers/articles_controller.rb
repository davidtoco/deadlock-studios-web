class ArticlesController < ApplicationController

	#GET /articles
	def index
		@articles = Article.paginate(page: params[:page], per_page: 3)
	end

	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
		#Where
		#Article.where.not("id = ?", params[:id])
	end

	#GET /articles/new
	def new
		@article = Article.new 
	end

	#POST /articles
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to "/articles"
			
		else
			render :new 
		end
	end


	def article_params
		params.require(:article).permit(:title,:body)
	end

	

end

