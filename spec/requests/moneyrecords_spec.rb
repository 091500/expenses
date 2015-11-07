require 'rails_helper'

RSpec.describe "Moneyrecords", type: :request do
  describe "GET /moneyrecords" do
    it "works! (now write some real specs)" do
      get moneyrecords_path
      expect(response).to have_http_status(200)
    end
  end
end
