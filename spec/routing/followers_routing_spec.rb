require "spec_helper"

describe FollowersController do
  describe "routing" do

    it "routes to #index" do
      get("/followers").should route_to("followers#index")
    end

    it "routes to #new" do
      get("/followers/new").should route_to("followers#new")
    end

    it "routes to #show" do
      get("/followers/1").should route_to("followers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/followers/1/edit").should route_to("followers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/followers").should route_to("followers#create")
    end

    it "routes to #update" do
      put("/followers/1").should route_to("followers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/followers/1").should route_to("followers#destroy", :id => "1")
    end

  end
end
