require 'spec_helper'

describe DemandsController do

  describe "GET 'typein'" do
    it "should be successful" do
      get 'typein'
      response.should be_success
    end
  end
    it "should have the right title" do   #Test auf die richtige Bezeichnung im Titel
      get 'typein'
      response.should have_selector("title",
                        :content => "MLCLSP App | Typein")
    end
 end