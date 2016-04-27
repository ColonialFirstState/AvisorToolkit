require_relative '../acceptance/login_helper'

describe 'Supporting Content Page' do
  include_context 'valid login'

  before(:each) do
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
      page.should have_css('div.second-level', visible: false)
    end
  end

  describe 'Supporting content links' do
      it 'should have the following links' do
        content = find('.concepts').text
        titles = [
          'Returns of Australian shares',
          'Returns of global shares',
          'Returns of Australian fixed interest',
          'Returns of Global fixed interest',
          'Returns of Australian property securities',
          'Diversification can create more consistent returns',
          'Long-term investing',
          'Consequences of a short-term focus',
          'Benefits of dollar cost averaging',
          'Australian and global sharemarkets'
        ]
        titles.each do |title|
          expect(content).to include(title)
        end
      end
  end

  describe 'Previous Button' do
    it 'should direct to Income page when click' do
      find('div.previous').click
      expect(current_url).to include('/super_retirement/income')
    end
  end
  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
