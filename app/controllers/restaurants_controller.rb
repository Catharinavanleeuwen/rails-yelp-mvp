class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @category = Restaurant::CATEGORY
  end

  def edit
  end

  def create
    @category = Restaurant::CATEGORY
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @restaurant.destroy
  end
end

def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
