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

  describe 'Previous Button' do

    it 'should direct to Super when click' do
      find('div.previous').click
      expect(current_url).to include('/super')
    end
  end

end
