json.array!(@companies) do |company|
  json.extract! company, :id, :user_id, :name, :description, :status
  json.url company_url(company, format: :json)
end
