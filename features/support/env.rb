require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'test/unit'
require "capybara/rspec"
#require 'capybara/poltergeist'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

#Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end


#if ENV['chrome']
# Capybara.default_driver = :chrome
# Capybara.register_driver :chrome do |app|
# options = {
# :js_errors => false,
# :timeout => 360,
# :debug => false,
# :inspector => false,
# }
# Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
#elsif ENV['firefox']
# Capybara.default_driver = :firefox
# Capybara.register_driver :firefox do |app|
# options = {
# :js_errors => true,
# :timeout => 360,
# :debug => false,
# :inspector => false,
# }
# Capybara::Selenium::Driver.new(app, :browser => :firefox)
# end
#end

#  chrome=true bundle exec cucumber features/test.feature