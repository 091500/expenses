require 'rails_helper'

describe 'the signin process' do

  User.create(email: 'test@example.com', password: '12345678')

  it 'signs me in' do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Logged in'
  end
end

