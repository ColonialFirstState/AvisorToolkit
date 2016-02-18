require_relative '../../acceptance/login_helper'

describe 'Income in Retirement Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/retirement/income'
  end

  it 'should have the correct title' do
    expect(find('p.title').text).to eq('Income in Retirement')
  end

  describe 'Next Button' do

    it 'should direct to Supporting Content page when click' do
      find('div.next').click
      expect(current_url).to include('/supporting_content')
    end
  end

  describe 'Previous Button' do

    it 'should direct to Transition page when click' do
      find('div.previous').click
      expect(current_url).to include('/retirement/transition')
    end
  end
end
