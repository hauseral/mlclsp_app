require "spec_helper"

describe ResourcePeriodsController do
  describe "routing" do

    it "routes to #index" do
      get("/resource_periods").should route_to("resource_periods#index")
    end

    it "routes to #new" do
      get("/resource_periods/new").should route_to("resource_periods#new")
    end

    it "routes to #show" do
      get("/resource_periods/1").should route_to("resource_periods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resource_periods/1/edit").should route_to("resource_periods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resource_periods").should route_to("resource_periods#create")
    end

    it "routes to #update" do
      put("/resource_periods/1").should route_to("resource_periods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resource_periods/1").should route_to("resource_periods#destroy", :id => "1")
    end

  end
end
