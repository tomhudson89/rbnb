class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit ]
  def index
    @flats = Flat.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @booking = Booking.new
  end

  def update
    @flat.update(flat_params)
  end

  private

  def flat_params
    params.require(:flat).permit(:user_id, :address, :guests, :beds, :description, :price_per_night, :title, :photo)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
