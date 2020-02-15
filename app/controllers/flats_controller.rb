class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:city].present?
      @flats = Flat.search_by_address(params[:city])
    else
      @flats = Flat.geocoded
    end
    set_markers
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
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
    params.require(:flat).permit(:user, :address, :guests, :beds, :bedrooms, :description, :price_per_night, :title, photos: [])
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def set_markers
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
