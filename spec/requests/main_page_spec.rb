require 'rails_helper'

describe 'Static pages' do

  subject { page }

  describe 'Home page' do
    before { visit root_path }

    it { should have_content('Test App') }
    it { should_not have_title('| Home') }
  end

  describe 'Login page' do
    before { visit '/users/sign_in' }

    it { should have_content('Login') }
  end

end

describe 'the signin process', type: feature do

  it 'signs me in' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(page).to have_content 'Signed'
  end
end

