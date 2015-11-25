# walmart home page,
# This page provide the function: search produces, view the products details,
# you can also go shopping cart from this page, but "go shopping cart" function can be called in lot of scenarios
# so I put that function in web_app.rb

class Walmart < AppBase

  # this function will be called when instantiate this class, so that to make sure the page is fully loaded
  # more checking points can be added here for safety.
  def await(opts = nil)
    # wait till page loaded
    Watir::Wait.until {$browser.input(:id => "search").exists?}
    Watir::Wait.until {$browser.button(:class => "searchbar-submit js-searchbar-submit").exists?}
    sleep(3)
    self
  end


  def search(arg)
    sleep(1)
    $browser.text_field(:id, "search").set arg
    $browser.button(:class => "searchbar-submit js-searchbar-submit").click

  end

  def view_details_for_search_result_item(index)
    index = index.to_i
    #parent = $browser.div(:id => "tile-container")

    amount = $browser.as(:class => "js-product-title").count

    if(amount == 0)
      fail ("no search results")
      # if enter index larger than the max index, fail the scripts
    elsif(amount < index)
      fail ("search result less then #{index}")
    end

    item = $browser.as(:class => "js-product-title")[index - 1]
    item.click

  end

  def get_product_name(index)
    parent = $browser.div(:id => "tile-container")
    return parent.divs(:class => "js-tile js-tile-landscape tile-landscape")[index].text
  end



end