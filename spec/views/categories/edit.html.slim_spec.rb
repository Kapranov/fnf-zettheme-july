require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :displayed => false
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_user_id[name=?]", "category[user_id]"

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "textarea#category_description[name=?]", "category[description]"

      assert_select "input#category_displayed[name=?]", "category[displayed]"
    end
  end
end
