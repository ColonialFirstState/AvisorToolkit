require_relative '../../acceptance/login_helper'

describe 'Property Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/asset_classes/property'
  end

  describe 'Navigation' do
    it 'should select property in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Property')
    end

    it 'should direct to fixed interest profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/fixed_interest')
    end

    it 'should direct to shares page when click next button' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/shares')
    end
  end

  describe 'Content' do
    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('An example of investing in property')
    end

    it 'should have correct step explanation' do
      titles = all('.steps .st1 p')

      expect(titles[0].text).to eq('You buy ‘units’ in a property fund operated by an investment manager.')
      expect(titles[1].text).to eq('They invest your money into the development of commercial, retail, industrial properties, like shopping centres.')
      expect(titles[2].text).to eq('You may get periodic income in the form of a distribution from the fund. You may also make gains on your initial investment if that fund grows in value and you sell your ‘units’.')
    end
  end

  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
