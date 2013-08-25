class BooksController < ApplicationController
	before_filter :authenticate_user!

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.create(book_params)
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update book_params
		redirect_to	book_path(params[:id])
	end

	def search
		@query = params[:q]
		@books = Book.search_for(@query)
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			redirect_to books_path
		else
			render 'show'
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :author, :year, :rating, :description)
	end
end
