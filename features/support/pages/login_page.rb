require_relative '../base_page'

class LoginPage < BasePage
  def initialize
    page.visit "/login"
  end

  def type_password(password)
    fill_in 'password', with: password
    self
  end

  def click_login
    click_on('Log In')

    if current_path == "/" then
      HomePage.new
    else
      self
    end
  end

  def login_with(password)
    type_password(password).click_on
  end
end
