require 'spec_helper'

describe "periods/new.html.erb" do
  before(:each) do
    assign(:period, stub_model(Period,
      :period_name => 1
    ).as_new_record)
  end

  it "renders new period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => periods_path, :method => "post" do
      assert_select "input#period_period_name", :name => "period[period_name]"
    end
  end
end
