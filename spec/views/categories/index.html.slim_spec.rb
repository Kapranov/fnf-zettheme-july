require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :displayed => false
      ),
      Category.create!(
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :displayed => false
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
