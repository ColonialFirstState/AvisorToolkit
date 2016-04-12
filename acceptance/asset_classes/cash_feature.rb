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
end
