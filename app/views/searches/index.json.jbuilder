json.array!(@searches) do |search|
  json.extract! search, :id, :name, :search_id, :search_model
  json.url search_url(search, format: :json)
end
