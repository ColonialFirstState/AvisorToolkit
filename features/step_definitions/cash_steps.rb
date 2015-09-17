Given(/^I logged in$/) do
  @page = HomePage.new.login_with('test123')
end

And(/^I am on the explain cash page$/) do
  @page = @page.goto_cash_page
end

Then(/^I see the heading "(.*)"/) do |heading|
  expect(find('.basics .title').text).to eq(heading)
end
