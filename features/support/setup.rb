require 'middleman'
require 'capybara/cucumber'

#Capybara.app = Middleman::Application.server.inst do
#  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
#  set :environment, :development
#end

ENV['PASS_DIGEST'] = "7NcYcNGWMxapfjrDQIyYNa2M8PPBvHA1J8MCZVNPda4="
puts "generating"
`bundle exec middleman build`
require './apps/advisor'
Capybara.app = Advisor.app
