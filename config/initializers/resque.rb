if ENV["REDIS_URL"]
    $redis = Redis.new(:url => ENV["REDIS_URL"])
    Resque.redis = $redis
end

Resque.logger = Logger.new("#{Rails.root}/log/resque.log")
Resque.logger.formatter = Resque::VeryVerboseFormatter.new