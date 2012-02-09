require 'spec_helper'

describe "follower_products/index.html.erb" do
  before(:each) do
    assign(:follower_products, [
      stub_model(FollowerProduct,
        :coefficient => 1
      ),
      stub_model(FollowerProduct,
        :coefficient => 1
      )
    ])
  end

  it "renders a list of follower_products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
