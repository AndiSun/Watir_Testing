
require 'rubygems'
require 'watir-webdriver'


# this class is the main entry point of the web page workflow.
# this class is instantiated before each scenario, and can be accessed globally

# some function that are used very often can also be put here.
# So that, you do not need to create a page instance to invoke the function every time. like sign in, sign out, go to shopping cart

class WebApp < AppBase

  def initialize
  end

  def launch_the_app(url)
    log("   launching app from #{url}")
    $browser = Watir::Browser.start url, :chrome
    $browser.window.maximize
  end


  def wait_for_screen(screen_cls)
    screen_obj = nil
    begin
      screen_obj = screen_cls.new().await()
      log("on #{screen_cls.name} now")
    rescue
      fail("the app is not on #{screen_cls.name} !")
    end

    return screen_obj
  end

  def exists(screen_cls)
    if(screen_cls.new().exist())
      return true
    else
      return false
    end
  end


  def sign_in(username, password)
    if !$browser.a(:class => "header-account-signin", :text => "Sign In").exists?
      $browser.a(:class => "logo js-logo hide-content-max-l").click

    end

    $browser.a(:class => "header-account-signin", :text => "Sign In").click
    Watir::Wait.until {$browser.text_field(:id => "login-username").exist?}

    $browser.text_field(:id => "login-username").set username
    $browser.text_field(:id => "login-password").set password

    transition(
        :action => Proc.new(){
          $browser.button(:class => "btn login-sign-in-btn js-login-sign-in btn-block-max-s btn-block-max-s").click
        },
        :screen => Walmart_My_Account,
        :await => true
    )
  end

  def sign_out
    $browser.a(:href => "https://www.walmart.com/account", :text => "My Account").fire_event "onmouseover"
    sleep(2)
    $browser.li(:text => "Sign Out")
    sleep(5)
  end

  # go to shopping cart
  def go_shopping_cart
    if($browser.a(:href => "/cart").exists?)
      transition(
          :action => Proc.new(){
            $browser.a(:href => "/cart").click
          },
          :screen => ShoppingCart,
          :await => true
      )
    end

    if($browser.a(:href => "https://www.walmart.com/cart/").exists?)
      transition(
          :action => Proc.new(){
            $browser.a(:href => "https://www.walmart.com/cart/").click
          },
          :screen => ShoppingCart,
          :await => true
      )

    end

  end

end