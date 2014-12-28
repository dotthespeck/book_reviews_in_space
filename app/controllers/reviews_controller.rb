class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]


  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save
      redirect_to root_path, notice: "Review was successfully created"
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.update_attributes(review_params)
      redirect_to root_path, notice: "Review was successfully edited"
    else
      render :edit, notice: "Review did not update"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    if @review.destroy
      redirect_to root_path, notice: "Review was successfully deleted"
    else
      render :edit, notice: "Review was not deleted"
    end
  end

private
  def review_params
    params.require(:review).permit(:review, :book_id)
  end
end
