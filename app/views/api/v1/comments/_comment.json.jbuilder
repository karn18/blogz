json.extract! comment, :id, :body, :user, :created_at, :updated_at
json.url api_v1_post_comment_url(comment.post, comment, format: :json)
