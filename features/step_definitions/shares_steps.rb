Given(/^I am on the explain shares page$/) do
  @page = @page.go_to_asset_classes_page.click_shares
end
