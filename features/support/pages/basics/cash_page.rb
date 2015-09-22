require_relative '../../base_page'
require_relative 'explainer_contents'
#require_relative 'fixed_income_page'

module Basics
  class CashPage < BasePage
    include ExplainerContents

    def click_next
      find(".basics .next a").click
      Basics::FixedIncomePage.new()
    end

    def click_previous
      find(".basics .previous a").click
      BasePage.new()
    end
  end
end
