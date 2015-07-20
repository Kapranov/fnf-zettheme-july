require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :user => nil,
        :name => "Name",
        :sku => "Sku",
        :description => "MyText",
        :short_description => "MyText",
        :active => false,
        :weight => "9.99",
        :price => "9.99",
        :cost_price => "9.99",
        :featured => false,
        :stock_control => false,
        :category => nil
      ),
      Product.create!(
        :user => nil,
        :name => "Name",
        :sku => "Sku",
        :description => "MyText",
        :short_description => "MyText",
        :active => false,
        :weight => "9.99",
        :price => "9.99",
        :cost_price => "9.99",
        :featured => false,
        :stock_control => false,
        :category => nil
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
