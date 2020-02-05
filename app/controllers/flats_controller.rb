class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit ]
  def index
    @flats = Flat.all
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
