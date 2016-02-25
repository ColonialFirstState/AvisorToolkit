require_relative '../../acceptance/login_helper'

describe 'Retirement Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/retirement/transition'
  end

  it 'should have the correct title' do
    expect(find('p.title').text).to eq('Transition to Retirement')
  end

  describe 'Next Button' do

    it 'should direct to Income page when click' do
      find('div.next').click
      expect(current_url).to include('/retirement/income')
    end
  end

  describe 'Benefits' do
    it 'should have a correct sub-title' do
      expect(find('p.step.st1').text).to eq('Some of the benefits of a transition to retirement strategy:')
    end

    it 'should have correct src for boost income' do
      expect(find('#boost-income')['src'].include?('/images/retirement/transition_to_retirement/boost_income.svg')).to be_true
    end

    it 'should have correct src for tax saving on earnings' do
      expect(find('#tax-saving-on-earnings')['src'].include?('/images/retirement/transition_to_retirement/tax_saving_on_earnings.svg')).to be_true
    end

    it 'should have correct src for tax savings on income' do
      expect(find('#tax-saving-on-income')['src'].include?('/images/retirement/transition_to_retirement/tax_saving_on_income.svg')).to be_true
    end

    it 'should have correct text for boost income' do
      expect(find('#boost-income-text').text).to eq('Maintain or boost your income')
    end

    it 'should have correct text for tax saving on earnings' do
      expect(find('#tax-saving-on-earnings-text').text).to eq('Minimise tax on earnings')
    end

    it 'should have correct text for tax savings on income' do
      expect(find('#tax-saving-on-income-text').text).to eq('Minimise tax on income')
    end

  end

  describe 'Previous Button' do

    it 'should direct to Super when click' do
      find('div.previous').click
      expect(current_url).to include('/super')
    end
  end

end
