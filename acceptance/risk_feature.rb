require_relative '../acceptance/login_helper'

describe 'Risk Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/risk/profiles'
  end

  describe 'Navigation Bar' do

    it 'should select Risk tab' do
      expect(find('.nav .selected a').text).to eq('DIVERSIFICATION')
    end

    it 'should hide the second level' do
      page.should have_css('div.second-level', :visible => false)
    end
  end

  describe 'Buttons' do

    it 'should have correct behavior for Conservative Button' do
      find('#conservative').click
      expect(find('#risk-profile-title').text).to eq('Conservative portfolio')
      expect(find('.buttons .selected').text).to eq('CONSERVATIVE')
      expect(find('.risk-rating .rating-yes').text).to eq('1')
    end

    it 'should have correct behavior for Balanced Button' do
      find('#balanced').click
      expect(find('#risk-profile-title').text).to eq('Balanced portfolio')
      expect(find('.buttons .selected').text).to eq('BALANCED')
      expect(find('.risk-rating .rating-yes').text).to eq('4')
    end

    it 'should have correct behavior for Growth Button' do
      find('#growth').click
      expect(find('#risk-profile-title').text).to eq('Growth portfolio')
      expect(find('.buttons .selected').text).to eq('GROWTH')
      expect(find('.risk-rating .rating-yes').text).to eq('7')
    end
  end

  describe 'Next Button' do

    it 'should direct to cash page when click' do
      find('div.next').click
      expect(current_url).to include('/asset_classes/cash')
    end
  end

end
