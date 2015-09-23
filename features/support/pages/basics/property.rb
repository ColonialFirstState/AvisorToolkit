require_relative '../../base_page'
require_relative 'explainer_contents'

module Basics
  class PropertyPage < BasePage
    include ExplainerContents

    def click_next
      find(".basics .next a").click
      Basics::SharesPage.new()
    end

    def click_previous
      find(".basics .previous a").click
      Basics::FixedIncomePage.new()
    end
  end
end
