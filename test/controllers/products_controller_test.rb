require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { bar_code: @product.bar_code, cost: @product.cost, description: @product.description, has_iva: @product.has_iva, measure: @product.measure, measure_id: @product.measure_id, min_stock: @product.min_stock, name: @product.name, need_prescription: @product.need_prescription, product_category_id: @product.product_category_id, status: @product.status, stock: @product.stock } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { bar_code: @product.bar_code, cost: @product.cost, description: @product.description, has_iva: @product.has_iva, measure: @product.measure, measure_id: @product.measure_id, min_stock: @product.min_stock, name: @product.name, need_prescription: @product.need_prescription, product_category_id: @product.product_category_id, status: @product.status, stock: @product.stock } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
