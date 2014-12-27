class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]


  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to root_path, notice: "Review was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

private
  def review_params
    params.require(:review).permit(:review, :book_id)
  end
end
