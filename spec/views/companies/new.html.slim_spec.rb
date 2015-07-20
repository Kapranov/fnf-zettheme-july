require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :status => false
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_user_id[name=?]", "company[user_id]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "textarea#company_description[name=?]", "company[description]"

      assert_select "input#company_status[name=?]", "company[status]"
    end
  end
end
