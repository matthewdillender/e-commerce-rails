require "test_helper"

class CartedProductsControllerTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  class CartedProductsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
      @order = orders(:one)
      @carted_product = carted_products(:one)
    end
  
    test "should get index" do
      get order_carted_products_url(@order)
      assert_response :success
    end
  
    test "should create carted_product" do
      assert_difference('CartedProduct.count') do
        post order_carted_products_url(@order), params: { carted_product: { product_id: @carted_product.product_id, quantity: @carted_product.quantity, price_at_purchase: @carted_product.price_at_purchase } }
      end
  
      assert_response 201
    end
  
    test "should destroy carted_product" do
      assert_difference('CartedProduct.count', -1) do
        delete carted_product_url(@carted_product)
      end
  
      assert_response 204
    end
  end
  
end
