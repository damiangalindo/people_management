REDIS = Redis.connect(:url => ENV['REDISTOGO_URL'])
Resque.redis = REDIS