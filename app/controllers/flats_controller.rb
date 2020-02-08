class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit ]
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:city].present?
      @flats = Flat.where("address ILIKE ?", "%#{params[:city]}%")
    else
      @flats = Flat.geocoded

      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(title: params[:title], address: params[:address], guests: params[:guests], bedrooms: params[:bedrooms], beds: params[:beds], description: params[:description], price_per_night: params[:price_per_night])
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
    params.require(:flat).permit(:user_id, :address, :guests, :beds, :description, :price_per_night, :title, :photos)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
