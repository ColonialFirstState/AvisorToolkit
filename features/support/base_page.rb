require 'capybara/dsl'
require_relative 'pages/login_page'

class BasePage
  include Capybara::DSL

  def login_with(password)
    goto_login_page.login_with(password)
  end

  def goto_login_page
    LoginPage.new()
  end
end
