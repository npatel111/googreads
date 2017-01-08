class ReviewsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      @shelf = Shelf.find_or_create_by(name: "Reviewed", user_id: session["user_id"])
      @shelf.books << @review.book
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    byebug
    if current_user.id == @review.user_id
      render :edit
    else
      redirect_to reviews_path
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  def index
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :book_id)
  end
end
