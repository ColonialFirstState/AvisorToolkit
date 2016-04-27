require_relative '../../acceptance/login_helper'

describe 'Shares Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/asset_classes/shares'
  end

  describe 'Navigation' do
    it 'should select shares in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Shares')
    end

    it 'should direct to property profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/property')
    end

    it 'should direct to performance page when click next button' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/performance')
    end
  end

  describe 'Content' do
    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('An example of investing in shares')
    end

    it 'should have correct step explanation' do
      titles = all('.steps .st1 p')

      expect(titles[0].text).to eq('Investing in shares makes you part-owner of a company.')
      expect(titles[1].text).to eq('The company’s activity can generate profits or losses.')
      expect(titles[2].text).to eq('You may get income in the form of dividends from company profits. You may also make gains if that company grows in market value and you sell your shares.')
    end
  end
  
  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
