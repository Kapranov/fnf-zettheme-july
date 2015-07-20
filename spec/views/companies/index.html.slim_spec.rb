require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :status => false
      ),
      Company.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :status => false
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
