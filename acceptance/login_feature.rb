describe 'Login' do
  before(:each) { Capybara.reset_sessions! }

  describe 'with valid password' do
    it 'should direct to home page' do
      visit '/login'
      fill_in('password', with: 'test123')
      find('.login-button').click
      expect(page).to have_content('Wealth iQ')
    end
  end

  describe 'with invalid password' do
    it 'should stay in login page' do
      visit '/login'
      fill_in('password', with: 'wrong_password')
      find('.login-button').click
      expect(current_url).to include('/login')
    end
  end
end
