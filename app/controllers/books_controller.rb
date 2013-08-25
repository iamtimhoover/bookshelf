class BooksController < ApplicationController
	before_action :find_book, only: [:update, :edit, :show]
	before_filter :authenticate_user!, only: [:edit, :destroy]

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@edit_allowed = validate_current_user
		@destroy_allowed = validate_current_user
	end

	def create
		safe_book = params.require(:book).permit(:title, :author, :year, :description, :rating)
		@book = Book.new safe_book
		@book.user_email = current_user.email

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
		safe_book = params.require(:book).permit(:title, :author, :year, :description, :rating)
		if @book.update safe_book
			redirect_to	@book
		else
			render 'edit'
		end
	end

	def search
		@query = params[:q]
		@books = Book.search_for(@query)
	end

	def validate_current_user
		@book = Book.find(params[:id])
		@book.user_email == current_user.email ? true : false
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			redirect_to books_path
		else
			render 'show'
		end
	end

	def find_book
		@book = Book.find params[:id]
	end

	private

	def book_params
		params.require(:book).permit(:title, :author, :year, :rating, :description)
	end
end
