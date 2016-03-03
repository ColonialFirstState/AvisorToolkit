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

  describe 'content' do
    describe 'income stream' do
      it 'should have correct image path' do
        expect(find('#income-stream img.icon')['src']) .to include('/images/retirement/income_in_retirement/income_stream.svg')
      end

      it 'should have correct text' do
        expect(find('#income-stream p.text').text).to eq('You can turn your super into an income stream.')
      end
    end

    describe 'regular basis' do
      it 'should have correct image path' do
        expect(find('#regular-basis img.icon')['src']) .to include('/images/retirement/income_in_retirement/calendar.svg')
      end

      it 'should have correct text' do
        expect(find('#regular-basis p.text').text).to eq('It pays you an income on a regular basis, like a salary.')
      end
    end

    describe 'tax free' do
      it 'should have correct image path for "tax free"' do
        expect(find('#tax-free img.icon')['src']) .to include('/images/retirement/income_in_retirement/tax_free.svg')
      end

      it 'should have correct text' do
        expect(find('#tax-free p.text').text).to eq('This income in retirement is tax-free.')
      end
    end

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
