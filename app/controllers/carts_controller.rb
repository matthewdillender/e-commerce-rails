class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  def show
    render json: @cart, include: :carted_products
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart.destroy
    head :no_content
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def cart_params
    params.require(:cart).permit(:user_id, :session_id)
  end
end
