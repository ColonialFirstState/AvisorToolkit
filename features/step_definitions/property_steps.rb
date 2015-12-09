Given(/^I am on the explain property page$/) do
  @page = @page.go_to_asset_classes_page.click_property
end
