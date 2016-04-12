require_relative '../acceptance/login_helper'

describe 'Home Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/'
  end

  describe 'Title' do
    it 'should has correct wording' do
      expect(find('div.title-text').text).to eq('Wealth iQ')
      expect(find('div.description').text).to eq('financial concepts explained')
    end
  end

  describe 'Navigation' do
    it 'should have five buttons' do
      expect(find('.risk .section-title').text).to eq('Diversification')
      expect(find('.asset-classes .section-title').text).to eq('Asset Classes')
      expect(find('.managed-funds .section-title').text).to eq('Managed Funds')
      expect(find('.super .section-title').text).to eq('Super & Retirement')
      expect(find('.supporting-content .section-title').text).to eq('Supporting Content')
    end

    it 'risk button should link to risk profile page' do
      find('div.risk').click
      expect(current_url).to include('/risk/profiles')
    end

    it 'asset classes button should link to cash page' do
      find('div.asset-classes').click
      expect(current_url).to include('/asset_classes/cash')
    end

    it 'managed funds button should link to managed funds page' do
      find('div.managed-funds').click
      expect(current_url).to include('/managed_funds')
    end

    it 'super button should link to super page' do
      find('div.super').click
      expect(current_url).to include('/super')
    end

    it 'supporting content button should link to supporting content page' do
      find('div.supporting-content').click
      expect(current_url).to include('/supporting_content')
    end
  end
end
