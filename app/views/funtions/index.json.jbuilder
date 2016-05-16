json.array!(@funtions) do |funtion|
  json.extract! funtion, :id, :movie_id, :hora, :sala
  json.url funtion_url(funtion, format: :json)
end
