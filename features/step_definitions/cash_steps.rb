And(/^I am on the explain cash page$/) do
  @page = @page.goto_cash_page
end

Then(/^I see explaination for "(.*)"/) do |heading|
  expect(@page.heading).to eq(heading)
end
