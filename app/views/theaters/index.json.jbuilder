json.array!(@theaters) do |theater|
  json.extract! theater, :id, :place, :direccion
  json.url theater_url(theater, format: :json)
end
