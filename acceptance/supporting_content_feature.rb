require_relative '../acceptance/login_helper'

describe 'Supporting Content Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/supporting_content'
  end

  it 'should have the correct title' do
    expect(find('div.title').text).to eq('Supporting Content')
  end

  it 'should open a new tab when clicking content button' do
    first('tbody tr td').click
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    expect(current_url).to include('.pdf')
  end
end
