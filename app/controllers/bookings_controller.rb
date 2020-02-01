class BookingsController < ApplicationController
  before_action :set_flat, except: [:index, :new]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = @user
    if @booking.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
