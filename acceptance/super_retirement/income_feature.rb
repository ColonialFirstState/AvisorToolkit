require_relative '../../acceptance/login_helper'

describe 'Income in Retirement Page' do
  include_context 'valid login'

  before(:each) do
    login
    visit '/super_retirement/income'
  end

  it 'should have the correct title' do
    expect(find('p.title').text).to eq('Income in Retirement')
  end

  it 'should have correct subtitle' do
    expect(find('.step.st1').text).to eq('Use your super to generate a regular tax-free income in retirement.')
  end

  describe 'content' do
    describe 'income stream' do
      it 'should have correct image path' do
        expect(find('#income-stream img.icon')['src']) .to include('/images/super_retirement/income/income_stream.svg')
      end

      it 'should have correct text' do
        expect(find('#income-stream p.text').text).to eq('You can turn your super into an income stream.')
      end
    end

    describe 'regular basis' do
      it 'should have correct image path' do
        expect(find('#regular-basis img.icon')['src']) .to include('/images/super_retirement/income/calendar.svg')
      end

      it 'should have correct text' do
        expect(find('#regular-basis p.text').text).to eq('It pays you an income on a regular basis, like a salary.')
      end
    end

    describe 'tax free' do
      it 'should have correct image path for "tax free"' do
        expect(find('#tax-free img.icon')['src']) .to include('/images/super_retirement/income/tax_free.svg')
      end

      it 'should have correct text' do
        expect(find('#tax-free p.text').text).to eq('This income in retirement is tax-free.')
      end
    end

  end

  describe 'Next Button' do
    it 'should direct to Supporting Content page when click' do
      find('a.right').click
      expect(current_url).to include('/supporting_content')
    end
  end

  describe 'Previous Button' do
    it 'should direct to Transition page when click' do
      find('div.previous').click
      expect(current_url).to include('/super_retirement/transition')
    end
  end
  describe 'disclaimer' do
    it 'should display disclaimer' do
      expect(find('.disclaimer').text).to eq('Colonial First State Investments Limited ABN 98 002 348 352, AFS Licence 232468 (Colonial First State) is the issuer of super, pension and investment products. This tool has been prepared by Colonial First State and may include general advice but does not take into account any person’s individual objectives, financial situation or needs. You should read the relevant Product Disclosure Statement (PDS) carefully before making any recommendations. Clients should read the PDS before making an investment decision and consider talking to a financial adviser. A PDS for Colonial First State’s products is available at colonialfirststate.com.au or by calling us on 13 18 36. Past performance is no indication of future performance.')
    end
  end
end
