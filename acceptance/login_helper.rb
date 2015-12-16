require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

shared_context 'valid login' do
  def login
    visit '/login'
    fill_in('password', :with => 'test123')
    find('.login-button').click
  end
end