require 'fileutils'

# some utility/helper functions here

# print out message to console
# example:
#   log("map closed")
#   log("map closed", self)
def log(msg, cls=nil)
  time_stamp = Time.now.strftime("%H:%M:%S")
  if cls.nil?
    print "      [#{time_stamp}] #{msg}\n"
  else
    print "      [#{time_stamp}]    #{cls.class.name}: #{msg}\n"
  end
end

# take a screenshot png, save to ./screenshots/*.png
# if no file name given, use time stamp as file name
# example:
#   take_screenshot "a.png"
def take_screenshot(file_name=nil)
  # make sure screenshots folder exists
  FileUtils.mkdir_p './screenshots'

  # if file name given, use time stamp
  if file_name.nil?
    file_name = Time.now.strftime("%Y-%m-%d_%H-%M-%S.png")
  end

  sleep(1)
  $browser.screenshot.save "./screenshots/#{file_name}"
  log("screenshot taken: ./screenshots/#{file_name}")
  sleep(1)

  # add to report
  embed("./screenshots/#{file_name}", "image/png", "SCREENSHOT")
end
