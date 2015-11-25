
class PaymentDetails < AppBase

  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.h2(:text => "Card information").exist?}
    Watir::Wait.until {$browser.div(:text => "Last name on card").exist?}
    Watir::Wait.until {$browser.div(:text => "First name on card").exist?}
    Watir::Wait.until {$browser.label(:text => "Expiration date").exist?}

    self
  end


end