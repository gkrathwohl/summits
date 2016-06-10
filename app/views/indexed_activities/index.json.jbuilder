json.array!(@indexed_activities) do |indexed_activity|
  json.extract! indexed_activity, :id, :userId, :activityId
  json.url indexed_activity_url(indexed_activity, format: :json)
end
