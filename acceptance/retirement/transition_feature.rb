require_relative '../acceptance/login_helper'

describe 'Retirement Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/retirement/transition'
  end

  it 'should have the correct title' do
    expect(find('div.title').text).to eq('Transition to Retirement')
  end

end
