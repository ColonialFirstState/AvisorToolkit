Given(/^I am on the login page$/) do
  @page = HomePage.new.goto_login_page
end

And(/^I enter the correct passphrase$/) do
  @page.type_password('test123')
end

And(/^I enter the wrong passphrase$/) do
  @page.type_password('wrongpass')
end

When(/^I login$/) do
  @new_page = @page.click_login
end

Then(/^I am logged in$/) do
  expect(page.text).to_not match(/Login/)
end

Then(/^I am not logged in$/) do
  expect(page.text).to match(/Login/)
end
