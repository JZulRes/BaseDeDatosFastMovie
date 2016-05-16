json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :sinopsis, :clasificacion, :image, :calificacion, :genre
  json.url movie_url(movie, format: :json)
end
