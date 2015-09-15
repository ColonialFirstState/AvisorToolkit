require 'middleman'
require 'capybara/cucumber'

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
  set :environment, :test
end
