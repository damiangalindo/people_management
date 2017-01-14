redis: redis-server
mailer_worker: bundle exec rake environment resque:work QUEUE=emails_queue VERBOSE=true
log: tail -f -n 0 log/development.log
web: bundle exec puma -t 16:16 -p $PORT