require_relative '../../acceptance/login_helper'

describe 'Retirement Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/super_retirement/transition'
  end

  describe 'Navigation Bar' do
    it 'should select super_retirement tab' do
      expect(find('.first-level .nav .selected a').text).to eq('SUPER & RETIREMENT')
    end

    it 'should not hide the second level' do
      expect(page).to have_css('div.second-level', visible: true)
    end

    describe 'Second Level' do
      it 'should navigate to transition to super page when it is clicked' do
        click_link('Super')
        expect(current_url).to include('/super_retirement/super')
      end

      it 'should navigate to transition to super_retirement page when it is clicked' do
        click_link('Transition to Retirement')
        expect(current_url).to include('/super_retirement/transition')
      end

      it 'should navigate to income in super_retirement page when it is clicked' do
        click_link('Income in Retirement')
        expect(current_url).to include('/super_retirement/income')
      end
    end
  end
end
