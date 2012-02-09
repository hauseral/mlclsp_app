require 'spec_helper'

describe "follower_products/edit.html.erb" do
  before(:each) do
    @follower_product = assign(:follower_product, stub_model(FollowerProduct,
      :coefficient => 1
    ))
  end

  it "renders the edit follower_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => follower_products_path(@follower_product), :method => "post" do
      assert_select "input#follower_product_coefficient", :name => "follower_product[coefficient]"
    end
  end
end
