require_relative '../../acceptance/login_helper'

describe 'Property Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/asset_classes/property'
  end

  describe 'Navigation' do

    it 'should select property in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Property')
    end

    it 'should direct to fixed income profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/fixed_income')
    end

    it 'should direct to shares page when click next button' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/shares')
    end
  end

  describe 'Content' do

    it 'should have correct title' do
      expect(find('.explaination .title p').text).to eq('An example of investing in property')
    end

    it 'should have correct step explanation' do
      titles = all('.steps .st1 p')

      expect(titles[0].text).to eq('You buy ‘units’ in a property fund operated by an investment manager.')
      expect(titles[1].text).to eq('They invest your money into the development of commercial, retail, industrial properties, like shopping centres')
      expect(titles[2].text).to eq('You may get periodic income in the form of a distribution from the fund. You may also make gains on your initial investment if that fund grows in value and you sell your ‘units’.')
    end
  end
end
