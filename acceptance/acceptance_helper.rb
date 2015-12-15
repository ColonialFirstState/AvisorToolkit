require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../apps/advisor', __FILE__
# disable :run

Capybara.default_driver = :selenium

ENV['PASS_DIGEST'] = "7NcYcNGWMxapfjrDQIyYNa2M8PPBvHA1J8MCZVNPda4="
puts "generating"
`bundle exec middleman build`

Capybara.app = Advisor.app
Capybara.default_wait_time = 20

RSpec.configure do |config|
  config.include Capybara::DSL
end