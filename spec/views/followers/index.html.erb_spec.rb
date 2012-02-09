require 'spec_helper'

describe "followers/index.html.erb" do
  before(:each) do
    assign(:followers, [
      stub_model(Follower,
        :follower_name => "Follower Name"
      ),
      stub_model(Follower,
        :follower_name => "Follower Name"
      )
    ])
  end

  it "renders a list of followers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Follower Name".to_s, :count => 2
  end
end
