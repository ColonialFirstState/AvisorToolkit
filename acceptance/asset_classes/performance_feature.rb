require_relative '../../acceptance/login_helper'

describe 'Performance Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/asset_classes/performance'
  end

  describe 'Navigation' do
    it 'should select performance in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Performance')
    end

    it 'should direct to shares profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/shares')
    end

    it 'should direct to risk when click next button' do
      find('div.next').click
      expect(current_url).to include('/risk/profiles')
    end
  end

  describe 'Content' do
    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('Performance of Asset Classes')
    end

    it 'should have six asset buttons with correct title' do
      # The order is significant
      # https://trello.com/c/OEobbSRc
      expect(all('.legend').map(&:text)).to match_array(
        %w(Cash Fixed Aus\ Shares Int\ Shares Property Diversified)
      )
    end
  end

  # Checks if element has HTML class
  # The following matcher works, and is more concise but
  # takes 5 seconds to run.
  #
  #     expect(find('#aus-shares')).to have_css('.disabled')
  #
  # We can also do something like
  #
  #     find(el)[:class].include?(klass)
  #
  # but it'll match even if find(el)[:class] has a substring of klass
  # @return bool
  def class?(element_id, klass)
    find(element_id)[:class].split(' ').any? { |e| e == klass }
  end

  describe 'Chart buttons' do
    %w(aus-shares int-shares property fixed cash diversified).each do |id|
      it { expect(class?("##{id}", 'disabled')).to be(true) }
    end
  end

  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
