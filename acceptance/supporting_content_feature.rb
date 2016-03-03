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
    first('div.grid-3').click
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    expect(current_url).to include('.pdf')
  end

  describe 'Navigation Bar' do

    it 'should select supporting content tab' do
      expect(find('.nav .selected a').text).to eq('SUPPORTING CONTENT')
    end

    it 'should hide the second level' do
      page.should have_css('div.second-level', :visible => false)
    end
  end

  describe 'Previous Button' do

    it 'should direct to Income page when click' do
      find('div.previous').click
      expect(current_url).to include('/super_retirement/income')
    end
  end

end
