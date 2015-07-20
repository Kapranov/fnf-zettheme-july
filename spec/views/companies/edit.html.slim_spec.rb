require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :status => false
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_user_id[name=?]", "company[user_id]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "textarea#company_description[name=?]", "company[description]"

      assert_select "input#company_status[name=?]", "company[status]"
    end
  end
end
