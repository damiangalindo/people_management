web: rails server -b 0.0.0.0 -p 3000
redis: redis-server
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
log: tail -f -n 0 log/development.log
