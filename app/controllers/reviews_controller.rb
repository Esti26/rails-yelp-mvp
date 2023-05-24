class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    @review.save
    redirect_to(restaurant_reviews_path(@review.restaurant_id, @review.id))
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
