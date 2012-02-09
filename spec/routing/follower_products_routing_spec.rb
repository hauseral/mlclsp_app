require "spec_helper"

describe FollowerProductsController do
  describe "routing" do

    it "routes to #index" do
      get("/follower_products").should route_to("follower_products#index")
    end

    it "routes to #new" do
      get("/follower_products/new").should route_to("follower_products#new")
    end

    it "routes to #show" do
      get("/follower_products/1").should route_to("follower_products#show", :id => "1")
    end

    it "routes to #edit" do
      get("/follower_products/1/edit").should route_to("follower_products#edit", :id => "1")
    end

    it "routes to #create" do
      post("/follower_products").should route_to("follower_products#create")
    end

    it "routes to #update" do
      put("/follower_products/1").should route_to("follower_products#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/follower_products/1").should route_to("follower_products#destroy", :id => "1")
    end

  end
end
