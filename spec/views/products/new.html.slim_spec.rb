require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :user => nil,
      :name => "MyString",
      :sku => "MyString",
      :description => "MyText",
      :short_description => "MyText",
      :active => false,
      :weight => "9.99",
      :price => "9.99",
      :cost_price => "9.99",
      :featured => false,
      :stock_control => false,
      :category => nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_user_id[name=?]", "product[user_id]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_sku[name=?]", "product[sku]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "textarea#product_short_description[name=?]", "product[short_description]"

      assert_select "input#product_active[name=?]", "product[active]"

      assert_select "input#product_weight[name=?]", "product[weight]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_cost_price[name=?]", "product[cost_price]"

      assert_select "input#product_featured[name=?]", "product[featured]"

      assert_select "input#product_stock_control[name=?]", "product[stock_control]"

      assert_select "input#product_category_id[name=?]", "product[category_id]"
    end
  end
end
