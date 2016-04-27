require_relative '../acceptance/login_helper'

describe 'Home Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/'
  end

  describe 'Title' do
    it 'should has correct wording' do
      expect(find('div.title-text').text).to eq('Wealth iQ')
      expect(find('div.description').text).to eq('financial concepts explained')
    end
  end

  describe 'Navigation' do
    it 'should have five buttons' do
      expect(find('.risk .section-title').text).to eq('Diversification')
      expect(find('.asset-classes .section-title').text).to eq('Asset Classes')
      expect(find('.managed-funds .section-title').text).to eq('Managed Funds')
      expect(find('.super .section-title').text).to eq('Super & Retirement')
      expect(find('.supporting-content .section-title').text).to eq('Supporting Content')
    end

    it 'risk button should link to risk profile page' do
      find('div.risk').click
      expect(current_url).to include('/risk/profiles')
    end

    it 'asset classes button should link to cash page' do
      find('div.asset-classes').click
      expect(current_url).to include('/asset_classes/cash')
    end

    it 'managed funds button should link to managed funds page' do
      find('div.managed-funds').click
      expect(current_url).to include('/managed_funds')
    end

    it 'super button should link to super page' do
      find('div.super').click
      expect(current_url).to include('/super')
    end

    it 'supporting content button should link to supporting content page' do
      find('div.supporting-content').click
      expect(current_url).to include('/supporting_content')
    end
  end

  describe 'Legal information' do
    it 'should show "Important information"' do
      expect(find('div.disclaimer > .important-information').text).to eq('Important information')
    end

    it 'should bring user to colornialfirststate\'s website when clicked on the link' do
      find('#cfs').click
      expect(current_url).to include('colonialfirststate.com.au')
    end

    describe 'Disclaimer content' do
      it 'tells you your responsibility' do
        text = find('div.disclaimer').text
        expect(text).to include('The information contained in this tool is for your use, as an adviser, with your clients. It is solely your responsibility to use this tool in accordance with your legal obligations, including any license conditions that apply to you.')
        expect(text).to include('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person\'s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State\'s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
        expect(text).to include('While all care has been taken in the preparation of this tool (using sources believed to be reliable and accurate), to the maximum extent permitted by law, no person including Colonial First State or any member of the Commonwealth Bank of Australia group of companies, accepts responsibility for any loss suffered by any person arising from reliance on this information.')
      end
    end

  end
end
