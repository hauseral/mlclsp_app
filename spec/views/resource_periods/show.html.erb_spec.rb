require 'spec_helper'

describe "resource_periods/show.html.erb" do
  before(:each) do
    @resource_period = assign(:resource_period, stub_model(ResourcePeriod,
      :capacity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
