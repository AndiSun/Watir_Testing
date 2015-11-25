# checkout page
class CheckoutShipping < AppBase

  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.h1(:class => "checkout-heading").exist?}
    sleep(3)
    self
  end

  def choose_free_shipping_and_address
    shipping = $browser.divs(:class => "radio-expanded radio-option-blue  js-shipping")[0]
    shipping.click
    $browser.buttons(:text => "Continue")[0].click
    sleep(1)
    Watir::Wait.until {$browser.buttons(:text => "Continue")[1].visible? }
    $browser.div(:text => "850 Cherry Ave").click
    $browser.buttons(:text => "Continue")[1].click
    sleep(1)
  end



end