require "application_system_test_case"

class PaymentLinksTest < ApplicationSystemTestCase
  setup do
    @payment_link = payment_links(:one)
  end

  test "visiting the index" do
    visit payment_links_url
    assert_selector "h1", text: "Payment links"
  end

  test "should create payment link" do
    visit payment_links_url
    click_on "New payment link"

    fill_in "Payid", with: @payment_link.payid
    fill_in "Paymentplatform", with: @payment_link.paymentplatform_id
    click_on "Create Payment link"

    assert_text "Payment link was successfully created"
    click_on "Back"
  end

  test "should update Payment link" do
    visit payment_link_url(@payment_link)
    click_on "Edit this payment link", match: :first

    fill_in "Payid", with: @payment_link.payid
    fill_in "Paymentplatform", with: @payment_link.paymentplatform_id
    click_on "Update Payment link"

    assert_text "Payment link was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment link" do
    visit payment_link_url(@payment_link)
    click_on "Destroy this payment link", match: :first

    assert_text "Payment link was successfully destroyed"
  end
end
