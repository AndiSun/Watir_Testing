class ShoppingCart < AppBase

  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.div(:class => "pos-totals s-padding-sides js-pos-totals").exists?}
    sleep(2)
    self
  end

  def check_items_number(num)
    if(!$browser.h3(:class => "cart-list-title").span.text.include? num.to_s)
      fail("Shopping cart items number does not match!")
    else
      log("Shopping cart has #{num} items, pass!")
    end
  end

  def has_items(product_name)
    return $browser.span(:text => "#{product_name}").exist?
  end

  def checkout
    transition(
        :action => Proc.new(){
          $browser.a(:href => "/checkout/").click
        },
        :screen => CheckoutShipping,
        :await => true
    )
  end

  def remove_product
    $browser.button(:text => "Remove").click
  end


end