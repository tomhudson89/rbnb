require "time"


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
    @booking.user = current_user
    @booking.flat = Flat.find(params[:flat_id])
    if @booking.save!
      redirect_to edit_booking_path(@booking)
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
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_flat
    @flat = Flat.find(params[:flats_id])
  end

end
