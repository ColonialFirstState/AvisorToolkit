require 'middleman'
require './advisor'
require 'capybara/cucumber'

Capybara.app = Advisor.app
