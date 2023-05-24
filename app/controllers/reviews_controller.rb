class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    redirect_to(restaurant_path(params[:restaurant_id]))
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to(restaurant_path(params[:restaurant_id]))
    else
      render :restaurant, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
