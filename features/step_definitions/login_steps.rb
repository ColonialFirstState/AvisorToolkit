Given(/^I am on the login page$/) do
  visit '/login'
end

And(/^I enter the correct passphrase$/) do
  fill_in 'Password', with: '123'
end

When(/^I login$/) do
  click_on 'Login'
end

Then(/^I am logged in$/) do

end

