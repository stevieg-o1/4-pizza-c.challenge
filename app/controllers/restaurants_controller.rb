class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :restaurant_not_found

    def index
        render json: Restaurant.all
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant.to_json(include: [pizzas: { only: [:id, :name, :ingredients]}])
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        render json: {}
    end

    private
    def restaurant_not_found
        render json: { error: "Restaurant not found" }, status: :not_found

    end

end