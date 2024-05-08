require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @order = orders(:one)
  end

  test "should get index" do
    sign_in @user
    get orders_url
    assert_response :success
  end

  test "should create order" do
    sign_in @user
    assert_difference('Order.count') do
      post orders_url, params: { order: { total_price: @order.total_price, status: @order.status } }
    end

    assert_response 201
  end

  test "should show order" do
    sign_in @user
    get order_url(@order)
    assert_response :success
  end

  test "should update order" do
    sign_in @user
    patch order_url(@order), params: { order: { total_price: @order.total_price, status: @order.status } }
    assert_response 200
  end

  test "should destroy order" do
    sign_in @user
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_response 204
  end
end

end
