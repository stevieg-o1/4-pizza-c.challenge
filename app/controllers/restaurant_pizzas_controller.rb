class RestaurantPizzasController < ApplicationController
    #rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    wrap_parameters format: []
    def create
        restaurant_pizza = RestaurantPizza.create(restaurant_pizza_params)
        if restaurant_pizza.valid?
        pizza = Pizza.find_by(id: restaurant_pizza_params[:pizza_id])
        render json: pizza
        else
            render json: { errors: restaurant_pizza.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def restaurant_pizza_params
        params.permit(:price, :restaurant_id, :pizza_id)
    end

    # def invalid_record
    #     render json: { errors: restaurant_pizza.errors.full_messages}, status: :unprocessable_entity

    # end
end