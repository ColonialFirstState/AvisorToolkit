require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../apps/advisor', __FILE__
# disable :run

Capybara.default_driver = :selenium

Capybara.app = Advisor
Capybara.default_wait_time = 20

RSpec.configure do |config|
  config.include Capybara::DSL
end