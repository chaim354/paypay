require "test_helper"

class PaymentLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_link = payment_links(:one)
  end

  test "should get index" do
    get payment_links_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_link_url
    assert_response :success
  end

  test "should create payment_link" do
    assert_difference("PaymentLink.count") do
      post payment_links_url, params: { payment_link: { payid: @payment_link.payid, paymentplatform_id: @payment_link.paymentplatform_id } }
    end

    assert_redirected_to payment_link_url(PaymentLink.last)
  end

  test "should show payment_link" do
    get payment_link_url(@payment_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_link_url(@payment_link)
    assert_response :success
  end

  test "should update payment_link" do
    patch payment_link_url(@payment_link), params: { payment_link: { payid: @payment_link.payid, paymentplatform_id: @payment_link.paymentplatform_id } }
    assert_redirected_to payment_link_url(@payment_link)
  end

  test "should destroy payment_link" do
    assert_difference("PaymentLink.count", -1) do
      delete payment_link_url(@payment_link)
    end

    assert_redirected_to payment_links_url
  end
end
