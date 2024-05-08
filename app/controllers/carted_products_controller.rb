class CartedProductsController < ApplicationController
  class CartedProductsController < ApplicationController
    before_action :set_order, only: [:index, :create, :destroy]
    before_action :set_carted_product, only: [:destroy]
  
    def index
      @carted_products = @order.carted_products
      render json: @carted_products
    end

    def create
      @carted_product = @order.carted_products.new(carted_product_params)
  
      if @carted_product.save
        render json: @carted_product, status: :created
      else
        render json: @carted_product.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @carted_product.destroy
      head :no_content
    end
  
    private
  
    def set_order
      @order = Order.find(params[:order_id])
    end
  
    def set_carted_product
      @carted_product = CartedProduct.find(params[:id])
    end
  
    def carted_product_params
      params.require(:carted_product).permit(:product_id, :quantity, :price_at_purchase)
    end
  end
  
end
