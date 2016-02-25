require_relative '../../acceptance/login_helper'

describe 'Performance Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/asset_classes/performance'
  end

  describe 'Navigation' do

    it 'should select performance in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Performance')
    end

    it 'should direct to shares profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/shares')
    end

    it 'should direct to managed funds when click next button' do
      find('div.next').click
      expect(current_url).to include('/managed_funds')
    end
  end

  describe 'Content' do

    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('Performance of Asset Classes')
    end

    it 'should have six asset buttons with correct title' do
      buttons_title = all('.legend').map {|button| button.text}

      expect(buttons_title).to eq(['Aus Shares', 'Int Shares', 'Property', 'Fixed', 'Cash', 'Diversified'])
    end

  end
end
