json.array!(@summit_completions) do |summit_completion|
  json.extract! summit_completion, :id, :summit, :userId
  json.url summit_completion_url(summit_completion, format: :json)
end
