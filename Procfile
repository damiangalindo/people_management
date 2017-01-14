redis: redis-server
mailer_worker: bundle exec rake environment resque:work QUEUE=emails_queue VERBOSE=true
log: tail -f -n 0 log/development.log
web: rails server -b 0.0.0.0 -p 3000