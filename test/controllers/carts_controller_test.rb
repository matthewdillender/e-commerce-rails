require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  class CartsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:one)
      @cart = carts(:one)
    end
  
    test "should show cart" do
      sign_in @user
      get cart_url
      assert_response :success
    end
  
    test "should create cart" do
      sign_in @user
      assert_difference('Cart.count') do
        post carts_url, params: { cart: { user_id: @cart.user_id, session_id: @cart.session_id } }
      end
  
      assert_response 201
    end
  
    test "should destroy cart" do
      sign_in @user
      assert_difference('Cart.count', -1) do
        delete cart_url
      end
  
      assert_response 204
    end
  end
  
end
