
class Walmart_You_Just_Added < AppBase

  def await(opts = nil)
    # wait until product details page is loaded
    Watir::Wait.until {$browser.div(:class => "Modal-outer js-pac-modal").exist? }
    Watir::Wait.until {$browser.h3(:class => "m-margin-ends").text.include? "You just added" }

    sleep(2)
    self
  end

  def click_checkout_button(username, password)

    $browser.a(:href => "/checkout/").click

    wait_true(60){ $web_app.exist(SignIn) || $web_app.exist(CheckoutShipping) }

    if($web_app.exist(SignIn))
      _sign_in_screen = $web_app.wait_for_screen(SignIn)
      _sign_in_screen.sign_in(username, password)
    end

    transition(
        :action => Proc.new(){
        },
        :screen => CheckoutShipping,
        :await => false
    )

  end

  def click_view_cart_button
    transition(
        :action => Proc.new(){
          $browser.a(:href => "/cart/").click
        },
        :screen => ShoppingCart,
        :await => false
    )
  end

  def dismiss_checkout_dialog_screen
    transition(
        :action => Proc.new(){
          $browser.button(:class => "Modal-closeButton hide-content display-block-m js-modal-close").click
        },
        :screen => Walmart_Product_Details,
        :await => true
    )
  end

end

