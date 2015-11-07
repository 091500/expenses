require "rails_helper"

RSpec.describe MoneyrecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/moneyrecords").to route_to("moneyrecords#index")
    end

    it "routes to #new" do
      expect(:get => "/moneyrecords/new").to route_to("moneyrecords#new")
    end

    it "routes to #show" do
      expect(:get => "/moneyrecords/1").to route_to("moneyrecords#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/moneyrecords/1/edit").to route_to("moneyrecords#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/moneyrecords").to route_to("moneyrecords#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/moneyrecords/1").to route_to("moneyrecords#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/moneyrecords/1").to route_to("moneyrecords#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/moneyrecords/1").to route_to("moneyrecords#destroy", :id => "1")
    end

  end
end
