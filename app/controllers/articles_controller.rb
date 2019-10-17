class ArticlesController < ApplicationController

	def index
		@articles = Article.all

	end

	def edit
		@article = Article.find(params[:id])
		@authors = Author.all

	end


	def new

		puts "Inside New Action of ArticlesController"

		@authors = Author.all
		@article = Article.new

	end


	def create

		@article = Article.create(title: params[:articles][:title], author: Author.find_by(id: params[:articles][:author]), body: params[:articles][:body], url: params[:articles][:url])

		redirect_to articles_path

	end

	def update

		p = params

		puts "TESTTTT"

		puts p

		@article = Article.find_by(id: params[:id])

		@author = Author.find_by(id: params[:article][:author])

		puts "Start"
		puts @author
		puts "End"


		@article.title = params[:article][:title]
		@article.author = @author
		@article.body = params[:article][:body]
		@article.url = params[:article][:url]


		@article.save

		redirect_to articles_path

	end


	def show

		@article = Article.find(params[:id])

		puts @article
	end



	def destroy

		@article = Article.find(params[:id])

		@article.destroy

		redirect_to articles_path

	end




end