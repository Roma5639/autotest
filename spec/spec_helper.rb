require 'capybara'
require 'capybara/dsl'
require 'webdrivers'
require 'pry'

include Capybara::DSL

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.current_driver = :selenium_chrome

require_relative '../spec/ui_tests/pages/rozetka_main_page'
require_relative '../spec/ui_tests/pages/gamezone_page'
require_relative '../spec/ui_tests/pages/consoles'
require_relative '../spec/ui_tests/pages/base_page'
require_relative '../spec/ui_tests/pages/household_appliances_page'
require_relative '../spec/ui_tests/pages/blenders_page'
require_relative '../spec/ui_tests/pages/item_page'
require_relative '../spec/ui_tests/pages/cart_module_window'
