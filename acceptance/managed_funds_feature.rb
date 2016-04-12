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
      expect(find('.explanation .title').text).to eq('Example of how a managed fund works')
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
end
