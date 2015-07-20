json.array!(@products) do |product|
  json.extract! product, :id, :user_id, :name, :sku, :description, :short_description, :active, :weight, :price, :cost_price, :featured, :stock_control, :category_id
  json.url product_url(product, format: :json)
end
