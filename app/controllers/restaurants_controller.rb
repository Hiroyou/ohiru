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

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end
