json.data @posts, partial: "api/v1/posts/post", as: :post
json.metadata @metadata if @metadata
