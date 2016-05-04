require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../apps/advisor', __FILE__
# disable :run

Capybara.default_driver = :selenium

ENV['PASS_DIGEST'] = 'Mw5t4KDjAI/HsBB18nI+5+fCi1CfuVqkGN4nSP9mdhU='
puts 'generating'
`bundle exec middleman build`

Capybara.app = Advisor.app
Capybara.default_wait_time = 20

RSpec.configure do |config|
  config.include Capybara::DSL
end
