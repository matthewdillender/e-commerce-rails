class OrdersController < ApplicationController
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
  
    def index
      @orders = Order.all
      render json: @orders
    end

    def show
      render json: @order, include: :carted_products
    end
  
    def create
      @order = current_user.orders.new(order_params)
  
      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @order.destroy
      head :no_content
    end
  
    private
  
    def set_order
      @order = current_user.orders.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:total_price, :status)
    end
  end
  
end
