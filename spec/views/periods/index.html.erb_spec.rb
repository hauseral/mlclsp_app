require 'spec_helper'

describe "periods/index.html.erb" do
  before(:each) do
    assign(:periods, [
      stub_model(Period,
        :period_name => 1
      ),
      stub_model(Period,
        :period_name => 1
      )
    ])
  end

  it "renders a list of periods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
