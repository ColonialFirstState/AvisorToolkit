describe 'Login' do

  describe 'with valid password' do

    it 'should direct to home page' do
      visit '/login'
      fill_in('password', :with => 'test123')
      find('.login-button').click
      expect(page).to have_content('Wealth iQ')
    end
  end
end
