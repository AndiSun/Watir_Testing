require 'rspec/expectations'
require  'watir-webdriver'

# setup and tear-down, run before and after each Scenario
Before do |scenario|

  # global variable for the app, it is ready to use in each steps.
  $web_app = WebApp.new
  #
  #print("Scenario: #{scenario.title}\n")
  #$stop_count = scenario.raw_steps.count
  #$step_index = 0
  ## print out the first step if exists
  #if $step_index < $stop_count
  #  print("    #{scenario.raw_steps[$step_index].keyword}#{scenario.raw_steps[$step_index].name} \n")
  #end
end


# after each scenario
After do |scenario|
  if(scenario.failed?)
    take_screenshot
  end

  print("\n")
  if !$browser.nil?
    $browser.close
  end
end

#
## after each step
#AfterStep do |scenario|
#  # print out next step if exists
#  $step_index += 1
#  if $step_index < $stop_count
#    print("    #{scenario.raw_steps[$step_index].keyword}#{scenario.raw_steps[$step_index].name} \n")
#  end
#end
