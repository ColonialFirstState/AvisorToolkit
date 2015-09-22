Given(/^I logged in$/) do
  @page = HomePage.new.login_with('test123')
end

Then(/^I see (.*) is selected on top level menu$/) do |item_selected|
  expect(@page.selected_top_menu_item.text).to eq(item_selected.upcase)
end

Then(/^I see (.*) is selected on second level menu$/) do |item_selected|
  expect(@page.selected_second_level_menu_item.text).to eq(item_selected)
end

Then(/^I see that it has a risk rating of (\d+)$/) do |rating|
  expect(@page.risk_rating).to eq(rating)
end
