require_relative '../../acceptance/login_helper'

describe 'Performance Page' do
  include_context 'valid login'

  before (:each) do
    login
    visit '/asset_classes/performance'
  end

  describe 'Navigation' do

    it 'should select performance in second navigation level' do
      expect(find('.second-level .nav .selected a').text).to eq('Performance')
    end

    it 'should direct to shares profile when click previous button' do
      find('div.previous').click
      expect(current_url).to include('/asset_classes/shares')
    end

    it 'should direct to risk when click next button' do
      find('div.next').click
      expect(current_url).to include('/risk/profiles')
    end
  end

  describe 'Content' do

    it 'should have correct title' do
      expect(find('.explanation .title').text).to eq('Performance of Asset Classes')
    end

    it 'should have six asset buttons with correct title' do
      buttons_title = all('.legend').map {|button| button.text}

      expect(buttons_title).to eq(['Aus Shares', 'Int Shares', 'Property', 'Fixed', 'Cash', 'Diversified'])
    end

  end

  # Checks if element has HTML class
  # The following matcher works, and is more concise but
  # takes 5 seconds to run.
  #
  #     expect(find('#aus-shares')).to have_css('.disabled')
  #
  # We can also do something like
  #
  #     find(el)[:class].include?(klass)
  #
  # but it'll match even if find(el)[:class] has a substring of klass
  # @return bool
  def class?(element_id, klass)
    find(element_id)[:class].split(' ').any? { |e| e == klass }
  end

  describe 'Chart buttons' do
    %w(aus-shares int-shares property fixed cash diversified).each do |id|
      it { expect(class?("##{id}", 'disabled')).to be(true) }
    end
  end
end
