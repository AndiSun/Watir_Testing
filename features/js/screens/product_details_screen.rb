
class Walmart_Product_Details < AppBase

  def await(opts = nil)
    # wait until product details page is loaded
    Watir::Wait.until {$browser.div(:class =>  "product-primary js-product-primary ResponsiveContainer").exists?}
    Watir::Wait.until {$browser.button(:id => "WMItemAddToCartBtn", :text => "Add to Cart").exists? }

    sleep(2)
    self
  end

  # User the transition function to add the product into the cart,
  # the transition function will return the next page.
  # in this case, after click button, I can get "You Just Addedd .... " dialog

  def add_into_cart
    transition(
        :action => Proc.new(){
          $browser.button(:id => "WMItemAddToCartBtn", :text => "Add to Cart").click
        },
        :screen => Walmart_You_Just_Added,
        :await => true
    )
  end

  def get_product_name
    return $browser.h1(:class => "js-product-heading heading-b product-name product-heading padding-ends").span.text
  end






end