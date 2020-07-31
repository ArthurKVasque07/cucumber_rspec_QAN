require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "http://192.168.99.100:8080" #Docker windows
end