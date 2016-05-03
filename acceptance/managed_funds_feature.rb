require_relative '../acceptance/login_helper'

describe 'Managed Funds Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/managed_funds'
  end

  describe 'Navigation Bar' do
    it 'should select Managed Funds tab at first level' do
      expect(find('.first-level .nav .selected a').text).to eq('MANAGED FUNDS')
    end

    it 'should hide the second level' do
      page.should have_css('div.second-level', visible: false)
    end
  end

  describe 'Content' do
    it 'should have the correct title' do
      expect(find('.explanation .title').text).to eq('Example of how a managed fund is invested')
    end

    it 'should have five buttons with correct title' do
      buttons_title = all('.buttons .button').map(&:text)

      expect(buttons_title).to eq(['ALL ASSETS',
                                   'SHARE MIX',
                                   'PROPERTY MIX',
                                   'FIXED INCOME MIX',
                                   'CASH MIX'])
    end

    it 'should choose the all assets button by default' do
      expect(find('.buttons .selected').text). to eq('ALL ASSETS')
    end

    it 'should change the style of button and the pie chart when click on an asset button' do
      img_url = find('#managed-funds-chart')['src']

      find('#share-mix').click
      expect(find('.buttons .selected').text). to eq('SHARE MIX')
      expect(find('#managed-funds-chart')['src']).to_not eq(img_url)
    end
  end

  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
