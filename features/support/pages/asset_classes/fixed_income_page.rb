require_relative '../../base_page'
require_relative '../explainer_contents'

module AssetClasses
  class FixedIncomePage < BasePage
    include ExplainerContents

    def click_next
      find(".asset_classes .next a").click
      AssetClasses::PropertyPage.new()
    end

    def click_previous
      find(".asset_classes .previous a").click
      AssetClasses::CashPage.new()
    end
  end
end
