class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new()
  end

  def create
    @flats = Flat.all
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    redirect_id = @review.booking.flat.id
    if @review.save
      redirect_to flat_path(redirect_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_flat
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
