class RestaurantsController < ApplicationController
  before_filter :authenticate_user!

  # GET /restaurant
  def show
    #TODO: 表示するものがなければredirect

    #TODO: そのユーザの今日のお店を取ってくる
    @restaurant = Restaurant.find(4)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.valid?
      begin
        @restaurant.collect
      rescue
        render file: 'public/500.html', status: 500
        return
      end

      if @restaurant.save
        redirect_to new_restaurant_path
      else
        render action: "new"
      end
    else
      render action: "new"
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to new_restaurant_path
  end
end
