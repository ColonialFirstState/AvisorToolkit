require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

shared_context 'valid login' do
  def login
    visit '/login'
    fill_in('password', with: 'Together')
    find('.login-button').click
  end
end
