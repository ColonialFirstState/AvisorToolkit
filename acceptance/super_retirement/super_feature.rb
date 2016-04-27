require_relative '../../acceptance/login_helper'

describe 'Super Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/super_retirement/super'
  end

  describe 'Navigation Bar' do
    it 'should select retirement tab' do
      expect(find('.first-level .nav .selected a').text).to eq('SUPER & RETIREMENT')
    end

    it 'should not hide the second level' do
      expect(page).to have_css('div.second-level', visible: true)
    end

    describe 'Second Level' do
      it 'should navigate to transition to super page when it is clicked' do
        click_link('Super')
        expect(current_url).to include('/super_retirement/super')
      end

      it 'should navigate to transition to retirement page when it is clicked' do
        click_link('Transition to Retirement')
        expect(current_url).to include('/super_retirement/transition')
      end

      it 'should navigate to income in retirement page when it is clicked' do
        click_link('Income in Retirement')
        expect(current_url).to include('/super_retirement/income')
      end
    end

    describe 'title' do
      it 'should have correct text' do
        expect(find('.super .title').text).to eq('Example of how super works')
      end
    end
  end

  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
