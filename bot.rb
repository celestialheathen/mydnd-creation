require "selenium-webdriver"
require "chromedriver-helper"
require "dotenv/load"

driver = Selenium::WebDriver.for :chrome 
driver.get "https://www.dndbeyond.com/"

driver.find_element(id: "login-link").click

driver.find_element(id: "signin-with-google").click

driver.switch_to.window(driver.window_handles[1])
driver.find_element(id: "identifierId").send_keys "#{ENV['EMAIL']}"