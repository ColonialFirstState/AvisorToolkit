And(/^I am on the explain cash page$/) do
  @page = @page.go_to_asset_classes_page.click_cash
end

Then(/^I see explaination for "(.*)"/) do |heading|
  expect(@page.heading).to eq(heading)
end
