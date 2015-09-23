require_relative '../../base_page'
require_relative 'explainer_contents'
#require_relative 'fixed_income_page'

module AssetClasses
  class CashPage < BasePage
    include ExplainerContents

    def click_next
      find(".asset_classes .next a").click
      AssetClasses::FixedIncomePage.new()
    end

    def click_previous
      find(".asset_classes .previous a").click
      BasePage.new()
    end
  end
end
