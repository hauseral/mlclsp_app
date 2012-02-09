require 'spec_helper'

describe "periods/show.html.erb" do
  before(:each) do
    @period = assign(:period, stub_model(Period,
      :period_name => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
