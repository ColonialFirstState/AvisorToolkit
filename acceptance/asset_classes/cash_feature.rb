require_relative '../../acceptance/login_helper'

describe 'Cash Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/asset_classes/cash'
  end

  describe 'Navigation' do
    it 'should select cash in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Cash')
    end

    it 'should direct to fixed income page when click next button' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/fixed_income')
    end
  end

  describe 'Content' do
    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('An example of investing in cash')
    end

    it 'should have correct step explanation' do
      titles = all('.steps .st1 p')

      expect(titles[0].text).to eq('You loan money to a bank in the form of a term deposit.')
      expect(titles[1].text).to eq('The bank then lends money to borrowers and charges them interest on those loans.')
      expect(titles[2].text).to eq('Your deposit may receive a return in the form of interest plus you receive your initial loan at the end of the term.')
    end
  end
  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
