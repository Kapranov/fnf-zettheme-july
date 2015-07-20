FactoryGirl.define do
  factory :product do
    user nil
name "MyString"
sku "MyString"
description "MyText"
short_description "MyText"
active false
weight "9.99"
price "9.99"
cost_price "9.99"
featured false
stock_control false
category nil
  end

end
