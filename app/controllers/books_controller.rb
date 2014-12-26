class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

  def index
    @books = Book.all
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, :notice => "Book was successfully created"
    else
      render :new
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :url)
  end
end
