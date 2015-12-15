describe 'Login' do

  describe 'with valid password' do

    it 'should direct to home page' do
      visit 'http://localhost:8081/login'
      fill_in('password', :with => 'hello')
      find('.login-button').click
      expect(page).to have_content('Wealth iQ')
    end
  end
end
