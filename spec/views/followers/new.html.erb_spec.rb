require 'spec_helper'

describe "followers/new.html.erb" do
  before(:each) do
    assign(:follower, stub_model(Follower,
      :follower_name => "MyString"
    ).as_new_record)
  end

  it "renders new follower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => followers_path, :method => "post" do
      assert_select "input#follower_follower_name", :name => "follower[follower_name]"
    end
  end
end
