require_relative '../../acceptance/login_helper'

describe 'Retirement Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/super_retirement/transition'
  end

  it 'should have the correct title' do
    expect(find('p.title').text).to eq('Transition to Retirement')
  end

  describe 'Next Button' do

    it 'should direct to Income page when click' do
      find('div.next').click
      expect(current_url).to include('/super_retirement/income')
    end
  end

  context 'Benefits' do

    # before do
    #   find('#benefits-button').click
    # end

    xit 'should have a correct sub-title' do
      expect(find('p.step.st1').text).to eq('Some of the benefits of a transition to retirement strategy:')
    end

    xit 'should have correct src for boost income' do
      expect(find('#boost-income')['src'].include?('/images/super_retirement/transition/boost_income.svg')).to be_true
    end

    xit 'should have correct src for tax saving on earnings' do
      expect(find('#tax-saving-on-earnings')['src'].include?('/images/super_retirement/transition/tax_saving_on_earnings.svg')).to be_true
    end

    xit 'should have correct src for tax savings on income' do
      expect(find('#tax-saving-on-income')['src'].include?('/images/super_retirement/transition/tax_saving_on_income.svg')).to be_true
    end

    xit 'should have correct text for boost income' do
      expect(find('#boost-income-text').text).to eq('Maintain or boost your income')
    end

    xit 'should have correct text for tax saving on earnings' do
      expect(find('#tax-saving-on-earnings-text').text).to eq('Minimise tax on earnings')
    end

    xit 'should have correct text for tax savings on income' do
      expect(find('#tax-saving-on-income-text').text).to eq('Minimise tax on income')
    end

  end

  context 'Overview' do
    before do
      skip
      find('#overview-button').click
    end

    xit 'should have a correct sub-title' do
      expect(find('p.step.st1').text).to eq("You can start to access your super as soon as you reach your preservation age, even while you're working. A Transition to Retirement strategy allows you to maintain your current income or boost your retirement savings, while paying less tax. An example of how this works:")
    end

    xit 'should have correct src for working hours' do
      expect(find('#working-hours')['src'].include?('/images/super_retirement/transition/overview/working-hours.svg')).to be_true
    end

    xit 'should have correct src for saving' do
      expect(find('#saving')['src'].include?('/images/super_retirement/transition.svg')).to be_true
    end

    xit 'should have correct src for top up reduce income' do
      expect(find('#pocket')['src'].include?('/images/super_retirement/transition/overview/pocket.svg')).to be_true
    end

    xit 'should have correct text for working hours' do
      expect(find('#working-hours-text').text).to eq('Reduce your working hours')
    end

    xit 'should have correct text for saving' do
      expect(find('#saving-text').text).to eq('Transfer some of your super to a new pre-retirement pension')
    end

    xit 'should have correct text for tax savings on income' do
      expect(find('#pocket-text').text).to eq('Top up your reduce income from work by drawing from your pre-retirement pension')
    end

  end

  describe 'Page' do
    xit 'should show overview tab by default' do
      expect(find('#overview')['class'].include?('hide')).to be_false
    end

    xit 'should hide benefits tab by default' do
      expect(find('#benefits', visible: false)['class'].include?('hide')).to be_true
    end
  end

  describe 'Buttons' do
    xit 'should select overview button by default' do
      expect(find('#overview-button')['class'].include?('selected')).to be_true
    end
    xit 'should not select benefit button by default' do
      expect(find('#benefits-button')['class'].include?('selected')).to be_false
    end

    xit 'should show benefits page by clicking on benefits button' do
      find('#benefits-button').click
      expect(find('#benefits')['class'].include?('hide')).to be_false
    end

    xit 'should show overview page by clicking on overview button' do
      find('#overview-button').click
      expect(find('#overview')['class'].include?('hide')).to be_false
    end
  end

  describe 'Previous Button' do

    it 'should direct to Super when click' do
      find('div.previous').click
      expect(current_url).to include('/super_retirement/super')
    end
  end

end
