require 'rails_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/main_page/home'
      expect(page).to have_content('Sample App')
    end

    it "should not have a custom page title" do
      visit '/main_page/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/main_page/help'
      expect(page).to have_content('Help')
    end
  end


end