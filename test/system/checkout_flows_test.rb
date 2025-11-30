require "application_system_test_case"

class CheckoutFlowsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should complete the checkout flow" do
    # Sign in
    visit new_user_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_on "Log in"
    assert_current_path root_path

    # Add a book to the cart
    visit root_path
    click_on "Add to Cart", match: :first

    # Go to the cart
    visit cart_path(Cart.last)

    # Proceed to checkout
    click_on "Proceed to Checkout"
    assert_current_path new_order_path

    # Fill in checkout form
    fill_in "Address", with: "123 Test St"
    fill_in "Phone number", with: "1234567890"
    click_on "Place Order"

    # Verify order was created
    assert_current_path root_path
    assert_equal 1, Order.count
    assert_equal 0, Cart.last.cart_items.count
  end
end
