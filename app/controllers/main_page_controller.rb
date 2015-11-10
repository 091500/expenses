class MainPageController < ApplicationController

  def home
    redirect_to moneyrecords_path if user_signed_in?
  end

  def help
  end
end
