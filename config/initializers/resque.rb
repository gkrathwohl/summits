if ENV["REDIS_URL"]
    $redis = Redis.new(:url => ENV["REDIS_URL"])
    Resque.redis = $redis
end