require_relative '../acceptance/login_helper'

describe 'Risk Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/risk/profiles'
  end

  describe 'Navigation Bar' do
    it 'should select Risk tab' do
      expect(find('.nav .selected a').text).to eq('DIVERSIFICATION')
    end

    it 'should hide the second level' do
      page.should have_css('div.second-level', visible: false)
    end

    it 'should direct to performance when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/performance')
    end
  end

  describe 'Buttons' do
    it 'should have correct behavior for Conservative Button' do
      find('#conservative').click
      expect(find('#risk-profile-title').text).to eq('An example of a conservative portfolio')
      expect(find('.buttons .selected').text).to eq('CONSERVATIVE')
      expect(find('.risk-rating .rating-yes').text).to eq('1')
    end

    it 'should have correct behavior for Balanced Button' do
      find('#balanced').click
      expect(find('#risk-profile-title').text).to eq('An example of a balanced portfolio')
      expect(find('.buttons .selected').text).to eq('BALANCED')
      expect(find('.risk-rating .rating-yes').text).to eq('4')
    end

    it 'should have correct behavior for Growth Button' do
      find('#growth').click
      expect(find('#risk-profile-title').text).to eq('An example of a growth portfolio')
      expect(find('.buttons .selected').text).to eq('GROWTH')
      expect(find('.risk-rating .rating-yes').text).to eq('7')
    end
  end

  describe 'Next Button' do
    it 'should direct to managed funds page when click' do
      find('div.next').click
      expect(current_url).to include('/managed_funds')
    end
  end

  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
