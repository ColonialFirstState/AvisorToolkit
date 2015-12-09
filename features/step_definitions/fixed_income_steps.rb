And(/^I am on the explain fixed income page$/) do
  @page = @page.go_to_asset_classes_page.click_fixed_income
end

