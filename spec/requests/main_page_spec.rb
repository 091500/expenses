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

