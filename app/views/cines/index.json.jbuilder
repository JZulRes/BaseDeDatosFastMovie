json.array!(@cines) do |cine|
  json.extract! cine, :id, :name, :theater_id
  json.url cine_url(cine, format: :json)
end
