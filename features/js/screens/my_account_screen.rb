
class Walmart_My_Account < AppBase


  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.a(:text => "Check the status of any order").exist?}
    Watir::Wait.until {$browser.a(:text => "Update your credit card details").exist?}
    Watir::Wait.until {$browser.a(:text => "Edit your email address").exist?}
    Watir::Wait.until {$browser.a(:text => "Change your password").exist?}

    sleep(3)
    self
  end

  # this function will be called when the scripts wants to know if current page is "My account" page
  # sometimes,  after sign in, the website might load my account page or shopping cart page
  # you can use this function to check is the current page is My Account page
  def exists
    if($browser.a(:text => "Check the status of any order").exist? && $browser.a(:text => "Update your credit card details").exist?)
      return true
    else
      return false
    end
  end


end