json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :salt, :username, :birthday
  json.url user_url(user, format: :json)
end
