require_relative '../base_page'
require_relative 'explainer_contents'

module Risk
  class RiskPage < BasePage
    include ExplainerContents

    def click_next
      find(".risk .next a").click
      AssetClasses::CashPage.new()
    end
  end
end