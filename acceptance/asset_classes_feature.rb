require_relative '../acceptance/login_helper'

describe 'Asset Classes Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/asset_classes/cash'
  end

  describe 'Navigation Bar' do

    it 'should select Asset classes tab at first level' do
      expect(find('.first-level .nav .selected a').text).to eq('ASSET CLASSES')
    end

    describe 'Second Level' do

      it 'should navigate to cash page when click cash' do
        click_link('Cash')
        expect(current_url).to include('/asset_classes/cash')
      end

      it 'should navigate to fixed income page when click fixed income' do
        click_link('Fixed Income')
        expect(current_url).to include('/asset_classes/fixed_income')
      end

      it 'should navigate to property page when click property' do
        click_link('Property')
        expect(current_url).to include('/asset_classes/property')
        expect(find('.explaination .title p').text).to eq('An example of investing in property')
      end

      it 'should navigate to shares page when click shares' do
        click_link('Shares')
        expect(current_url).to include('/asset_classes/shares')
        expect(find('.explaination .title p').text).to eq('An example of investing in shares')
      end

      it 'should navigate to performance page when click performance' do
        click_link('Performance')
        expect(current_url).to include('/asset_classes/performance')
        expect(find('.explaination .title p').text).to eq('Performance of Asset Classes')
      end

    end
  end
end
