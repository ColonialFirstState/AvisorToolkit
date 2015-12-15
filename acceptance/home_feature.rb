require_relative '../acceptance/login_helper'

describe 'Home Page' do
  include_context "valid login"

  before (:all) do
    login
  end

  describe 'Title' do

    it 'should has correct wording' do
      expect(find('div.title-text').text).to eq('Wealth iQ')
      expect(find('div.description').text).to eq('financial concepts explained')
    end
  end

end