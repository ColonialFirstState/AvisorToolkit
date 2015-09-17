require_relative '../base_page'

class LoginPage < BasePage
  def type_password(password)
    fill_in 'password', with: password
    self
  end

  def click_login
    click_on('Login')

    if current_path == "/" then
      HomePage.new
    else
      self
    end
  end

  def login_with(password)
    type_password(password).click_login
  end
end
