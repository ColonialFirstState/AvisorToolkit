require_relative '../../base_page'
require_relative 'explainer_contents'

module Basics
  class FixedIncomePage < BasePage
    include ExplainerContents

    def click_next
      find(".basics .next a").click
      Basics::FixedIncomePage.new()
    end

    def click_previous
      find(".basics .previous a").click
      Basics::CashPage.new()
    end
  end
end