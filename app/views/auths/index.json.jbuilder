json.array!(@auths) do |auth|
  json.extract! auth, :id, :token, :user_id
  json.url auth_url(auth, format: :json)
end
