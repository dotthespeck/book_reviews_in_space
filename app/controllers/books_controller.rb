class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  id = params[:id]
  @book = Book.find(id)
  end


  def update

    @book.update(book_params)

    if @book.save
      redirect_to @book, notice: { :info => "Book added successfully" }
    else
      render :edit, notice: { :info => "Book did not save" }
    end
  end


  def book_params
    params.require(:book).permit(:title, :author, :description, :url)
  end
end
