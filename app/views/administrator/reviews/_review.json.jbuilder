json.extract! review, :id, :created_at, :updated_at
json.url administrator_review_url(review, format: :json)
