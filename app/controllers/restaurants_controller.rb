class RestaurantsController < ApplicationController
  before_filter :authenticate_user!

  # GET /restaurant
  def show
    restaurants = Restaurant.find_all_by_user_id(current_user.id)
    if restaurants.blank?
      redirect_to new_restaurant_path
      return
    end

    unless current_user.todays_restaurant_id
      current_user.todays_restaurant_id = restaurants.sample.id
      current_user.save
    end
    @restaurant = Restaurant.find(current_user.todays_restaurant_id)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @restaurants = Restaurant.find_all_by_user_id(current_user.id)
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    unless @restaurant.valid?
      @restaurants = Restaurant.find_all_by_user_id(current_user.id)
      render action: "new"
      return
    end

    begin
      @restaurant.collect
    rescue
      render file: 'public/500.html', status: 500
      return
    end

    @restaurant.user = current_user
    if @restaurant.save
      redirect_to new_restaurant_path
      return
    else
      @restaurants = Restaurant.find_all_by_user_id(current_user.id)
      render action: "new"
      return
    end
  end

  # DELETE /restaurants/1
  def destroy
    # TODO: check user_id

    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to new_restaurant_path
    return
  end
end
