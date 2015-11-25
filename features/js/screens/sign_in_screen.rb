
class SignIn < AppBase

  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.text_field(:name => "login-username").exists?}
    Watir::Wait.until {$browser.text_field(:name => "login-password").exists?}
    sleep(3)
    self
  end

  def exist
    if($browser.text_field(:name => "login-username").exists? && $browser.text_field(:name => "login-password").exists?)
      return true
    else
      return false
    end
  end

  def sign_in(username, password)
    $browser.text_field(:name => "login-username").set username
    $browser.text_field(:name => "login-password").set password
    $browser.button(:text => "Sign In").click


    wait_true(60){ $web_app.exist(Walmart_My_Account) || $web_app.exist(CheckoutShipping) }

    if($web_app.exist(Walmart_My_Account))
      transition(
          :action => Proc.new(){
          },
          :screen => Walmart_My_Account,
          :await => false
      )
    elsif($web_app.exist(CheckoutShipping))
      transition(
          :action => Proc.new(){
          },
          :screen => CheckoutShipping,
          :await => false
      )
    else
      fail("unhandle page !!")
    end

  end

end