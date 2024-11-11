json.extract! user, :id, :created_at, :updated_at
json.url administrator_user_url(user, format: :json)
