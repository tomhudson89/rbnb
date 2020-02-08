class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save!
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(bookings_params)
  end

  private

  def bookings_params
    params.require(:booking).permit(:user, :flat, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
