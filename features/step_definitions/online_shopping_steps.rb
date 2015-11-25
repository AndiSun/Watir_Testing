Then(/^I search "([^"]*)"$/) do |arg|
  _home_screen = $web_app.wait_for_screen(Walmart)
  _home_screen.search(arg)
end

Then(/^I view the details for the item at index (\d+)$/) do |index|
  _home_screen = $web_app.wait_for_screen(Walmart)
  _home_screen.view_details_for_search_result_item(index)


end

Then(/^I add the item into cart$/) do
  _product_details_screen = $web_app.wait_for_screen(Walmart_Product_Details)
  @product_name = _product_details_screen.get_product_name
  _you_just_added_screen =_product_details_screen.add_into_cart
  _you_just_added_screen.dismiss_checkout_dialog_screen

end


Then(/^I sign in as "([^"]*)" "([^"]*)" and view shopping cart$/) do |username, password|
  $web_app.sign_in(username, password)
  $web_app.go_shopping_cart
end

Given(/^I go to "([^"]*)"$/) do |url|
  $web_app.launch_the_app(url)
end

Then(/^I should see the added items$/) do
  _shopping_cart_screen = $web_app.wait_for_screen(ShoppingCart)
  _shopping_cart_screen.has_items(@product_name)

end
Then(/^I should see (\d+) items in shopping cart$/) do |num|
  _shopping_cart_screen = $web_app.wait_for_screen(ShoppingCart)
  _shopping_cart_screen.check_items_number(num)

end

Then(/^I checkout$/) do
  _shopping_cart_screen = $web_app.wait_for_screen(ShoppingCart)
  _shopping_cart_screen.checkout

end

Then(/^I choose "([^"]*)" in checkout$/) do |shipping_method|
  shipping_method.downcase!
  if(shipping_method.eql?("free ship"))
    $browser.span(:text => "FREE").click
  end
end

Then(/^I add the item into cart and checkout with "([^"]*)" "([^"]*)" account$/) do |username, password|
  _product_details_screen = $web_app.wait_for_screen(Walmart_Product_Details)
  @product_name = _product_details_screen.get_product_name
  _you_just_added_screen =_product_details_screen.add_into_cart
  _you_just_added_screen.click_checkout_button(username, password)
end


Then(/^I add the item into cart and view the cart$/) do
  _product_details_screen = $web_app.wait_for_screen(Walmart_Product_Details)
  @product_name = _product_details_screen.get_product_name
  _you_just_added_screen =_product_details_screen.add_into_cart
  _shopping_cart_screen = _you_just_added_screen.click_view_cart_button

end

Then(/^I sign in as "([^"]*)" "([^"]*)"$/) do |username, password|
  $web_app
end

Then(/^I add the item into cart and login as "([^"]*)" "([^"]*)"$/) do |username, password|
  _product_details_screen = $web_app.wait_for_screen(Walmart_Product_Details)
  @product_name = _product_details_screen.get_product_name
  _you_just_added_screen =_product_details_screen.add_into_cart
  _you_just_added_screen.dismiss_checkout_dialog_screen
  $web_app.sign_in(username, password)
end

Then(/^I go to cart page$/) do
  $web_app.go_shopping_cart
end

Then(/^I choose FREE shipping and address$/) do
  _check_out_screen = $web_app.wait_for_screen(CheckoutShipping)
  _check_out_screen.choose_free_shipping_and_address
end

Then(/^I am in Payment details page$/) do
  $web_app.wait_for_screen(PaymentDetails)
end

Then(/^I sign out$/) do
  $web_app.sign_out
end

Then(/^I remove the product$/) do
  _shopping_cart_screen = $web_app.wait_for_screen(ShoppingCart)
  _shopping_cart_screen.remove_product
end