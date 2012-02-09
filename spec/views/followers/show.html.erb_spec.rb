require 'spec_helper'

describe "followers/show.html.erb" do
  before(:each) do
    @follower = assign(:follower, stub_model(Follower,
      :follower_name => "Follower Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Follower Name/)
  end
end
