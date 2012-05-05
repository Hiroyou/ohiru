class RestaurantsController < ApplicationController
  before_filter :authenticate_user!

  # GET /restaurant
  def show
    restaurants = Restaurant.find_all_by_user_id(current_user.id)
    redirect_to new_restaurant_path if restaurants.blank?

    r = Random.new(Time.now.beginning_of_day.to_i)
    index = r.rand(restaurants.size)
    @restaurant = restaurants[index]

    redirect_to new_restaurant_path unless @restaurant.user_id == current_user.id
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
  end
end
