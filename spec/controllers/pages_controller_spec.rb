require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do                #Test auf Existenz der Seite
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

    it "should have the right title" do   #Test auf die richtige Bezeichnung im Titel
      get 'home'
      response.should have_selector("title",
                        :content => "MLCLSP App | Home")
    end
 end

