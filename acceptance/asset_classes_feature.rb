require_relative '../acceptance/login_helper'

describe 'Asset Classes Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/asset_classes/cash'
  end

  describe 'Navigation Bar' do
    it 'should select Asset classes tab at first level' do
      expect(find('.first-level .nav .selected a').text).to eq('ASSET CLASSES')
    end

    describe 'Second Level' do
      it 'should navigate to cash page when click cash' do
        click_link('Cash')
        expect(current_url).to include('/asset_classes/cash')
      end

      it 'should navigate to fixed interest page when click fixed interest' do
        click_link('Fixed Interest')
        expect(current_url).to include('/asset_classes/fixed_interest')
      end

      it 'should navigate to property page when click property' do
        click_link('Property Funds')
        expect(current_url).to include('/asset_classes/property')
      end

      it 'should navigate to shares page when click shares' do
        click_link('Shares')
        expect(current_url).to include('/asset_classes/shares')
      end

      it 'should navigate to performance page when click performance' do
        click_link('Performance')
        expect(current_url).to include('/asset_classes/performance')
      end
    end
  end
  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
