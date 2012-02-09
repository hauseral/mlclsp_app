require 'spec_helper'

describe "resource_periods/index.html.erb" do
  before(:each) do
    assign(:resource_periods, [
      stub_model(ResourcePeriod,
        :capacity => 1
      ),
      stub_model(ResourcePeriod,
        :capacity => 1
      )
    ])
  end

  it "renders a list of resource_periods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
