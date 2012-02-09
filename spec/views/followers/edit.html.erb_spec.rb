require 'spec_helper'

describe "followers/edit.html.erb" do
  before(:each) do
    @follower = assign(:follower, stub_model(Follower,
      :follower_name => "MyString"
    ))
  end

  it "renders the edit follower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followers_path(@follower), :method => "post" do
      assert_select "input#follower_follower_name", :name => "follower[follower_name]"
    end
  end
end
