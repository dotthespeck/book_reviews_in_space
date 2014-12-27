class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

  def index
    @books = Book.all.order(created_at: :desc)
    @user = User.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to root_path, :notice => "Book was successfully created"
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :description, :url, :user_id, :id)
  end
end
