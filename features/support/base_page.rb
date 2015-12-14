require 'capybara/dsl'
require_relative 'pages/login_page'

class BasePage
  include Capybara::DSL

  def login_with(password)
    goto_login_page.login_with(password)
  end

  def selected_top_menu_item
    find('.menu .first-level .selected')
  end

  def selected_second_level_menu_item
    find('.menu .second-level .selected')
  end

  def go_to_asset_classes_page
    click_on('Asset Classes')
    self
  end

  def go_to_risk_page
    click_on('Risk')
    Risk::RiskPage.new()
  end

  def click_asset_classes
    click_on('ASSET CLASSES')
    self
  end

  def click_cash
    click_on('Cash')
    AssetClasses::CashPage.new()
  end

  def click_fixed_income
    click_on('Fixed Income')
    AssetClasses::FixedIncomePage.new()
  end

  def click_property
    click_on('Property')
    AssetClasses::PropertyPage.new()
  end

  def click_shares
    click_on('Shares')
    AssetClasses::SharesPage.new()
  end

  def goto_login_page
    visit '/login'
    LoginPage.new()
  end
end
