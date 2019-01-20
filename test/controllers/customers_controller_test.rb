require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { comments: @customer.comments, credit_limit: @customer.credit_limit, credit_time_limit: @customer.credit_time_limit, direction: @customer.direction, discount: @customer.discount, email: @customer.email, exonerate_1: @customer.exonerate_1, exonerate_2: @customer.exonerate_2, exonerate_iva: @customer.exonerate_iva, interest_rate: @customer.interest_rate, phone: @customer.phone, preferential_price: @customer.preferential_price, province_id: @customer.province_id, status: @customer.status, type: @customer.type, user_id: @customer.user_id } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { comments: @customer.comments, credit_limit: @customer.credit_limit, credit_time_limit: @customer.credit_time_limit, direction: @customer.direction, discount: @customer.discount, email: @customer.email, exonerate_1: @customer.exonerate_1, exonerate_2: @customer.exonerate_2, exonerate_iva: @customer.exonerate_iva, interest_rate: @customer.interest_rate, phone: @customer.phone, preferential_price: @customer.preferential_price, province_id: @customer.province_id, status: @customer.status, type: @customer.type, user_id: @customer.user_id } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
