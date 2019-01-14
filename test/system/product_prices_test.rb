require "application_system_test_case"

class ProductPricesTest < ApplicationSystemTestCase
  setup do
    @product_price = product_prices(:one)
  end

  test "visiting the index" do
    visit product_prices_url
    assert_selector "h1", text: "Product Prices"
  end

  test "creating a Product price" do
    visit product_prices_url
    click_on "New Product Price"

    fill_in "End date", with: @product_price.end_date
    fill_in "Price distribution", with: @product_price.price_distribution
    fill_in "Price farmacy", with: @product_price.price_farmacy
    fill_in "Price public", with: @product_price.price_public
    fill_in "Product", with: @product_price.product_id
    fill_in "Start date", with: @product_price.start_date
    fill_in "Status", with: @product_price.status
    click_on "Create Product price"

    assert_text "Product price was successfully created"
    click_on "Back"
  end

  test "updating a Product price" do
    visit product_prices_url
    click_on "Edit", match: :first

    fill_in "End date", with: @product_price.end_date
    fill_in "Price distribution", with: @product_price.price_distribution
    fill_in "Price farmacy", with: @product_price.price_farmacy
    fill_in "Price public", with: @product_price.price_public
    fill_in "Product", with: @product_price.product_id
    fill_in "Start date", with: @product_price.start_date
    fill_in "Status", with: @product_price.status
    click_on "Update Product price"

    assert_text "Product price was successfully updated"
    click_on "Back"
  end

  test "destroying a Product price" do
    visit product_prices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product price was successfully destroyed"
  end
end
