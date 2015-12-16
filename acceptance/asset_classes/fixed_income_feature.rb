require_relative '../../acceptance/login_helper'

describe 'Fixed Income Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/asset_classes/fixed_income'
  end

  describe 'Navigation' do

    it 'should select fixed income in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Fixed Income')
    end

    it 'should direct to cash page when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/cash')
    end

    it 'should direct to property page when click next button' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/property')
    end
  end

  describe 'Content' do

    it 'should have correct title' do
      expect(find('.explaination .title p').text).to eq('An example of investing in fixed interest')
    end

    it 'should have correct step explanation' do
      titles = all('.steps .st1 p')

      expect(titles[0].text).to eq('You loan money to the government for a fixed term in the form of a government bond.')
      expect(titles[1].text).to eq('The government issues bonds when they need to raise money for things like improving roads.')
      expect(titles[2].text).to eq('At the end of the term you may get both your initial loan value and the agreed interest earned.')
    end
  end
end
