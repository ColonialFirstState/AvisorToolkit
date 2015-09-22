require 'capybara/dsl'
require_relative 'pages/login_page'

class BasePage
  include Capybara::DSL

  def login_with(password)
    goto_login_page.login_with(password)
  end

  def selected_top_menu_item
    find('#l1 .selected')
  end

  def selected_second_level_menu_item
    find('#l2 .selected')
  end

  def goto_cash_page
    click_asset_classes.click_cash
  end

  def click_asset_classes
    click_on('ASSET CLASSES')
    self
  end

  def click_cash
    click_on('Cash')
    Basics::CashPage.new()
  end

  def goto_login_page
    visit '/login'
    LoginPage.new()
  end
end
