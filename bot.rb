require "selenium-webdriver"
require "chromedriver-helper"
require "dotenv/load"

driver = Selenium::WebDriver.for :chrome 
driver.get "https://www.dndbeyond.com/"

driver.find_element(id: "login-link").click

driver.find_element(id: "signin-with-google").click

driver.switch_to.window(driver.window_handles[1])
driver.find_element(id: "identifierId").send_keys "#{ENV['EMAIL']}"

driver.find_element(id: "identifierNext").click

wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.find_element(name: "password").displayed? }

driver.find_element(name: "password").send_keys "#{ENV['PASSWORD']}"
driver.find_element(id: "passwordNext").click