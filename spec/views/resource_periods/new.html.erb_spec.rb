require 'spec_helper'

describe "resource_periods/new.html.erb" do
  before(:each) do
    assign(:resource_period, stub_model(ResourcePeriod,
      :capacity => 1
    ).as_new_record)
  end

  it "renders new resource_period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resource_periods_path, :method => "post" do
      assert_select "input#resource_period_capacity", :name => "resource_period[capacity]"
    end
  end
end
