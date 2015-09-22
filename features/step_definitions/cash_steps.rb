And(/^I am on the explain cash page$/) do
  @page = @page.click_asset_classes.click_cash
end

Then(/^I see explaination for "(.*)"/) do |heading|
  expect(@page.heading).to eq(heading)
end
