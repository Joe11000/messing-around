# Sidekiq API - https://github.com/mperham/sidekiq/wiki/API
require 'sidekiq/api'
# get a handle to the default queue
default_queue = Sidekiq::Queue.new

# get a handle to the mailer queue
development_urgent_queue = Sidekiq::Queue.new(:development_urgent)

# How many jobs are in the default queue?
default_queue.size # => 1001

# How many jobs are in the mailer queue?
development_urgent_queue.size # => 50

#Deletes all Jobs in a Queue, by removing the queue.
default_queue.clear




stats = Sidekiq::Stats.new

# Get the number of jobs that have been processed.
stats.processed # => 100

# Get the number of jobs that have failed.
stats.failed # => 3

# Get the queues with name and number enqueued.
stats.queues # => { "default" => 1001, "email" => 50 }

#Gets the number of jobs enqueued in all queues (does NOT include retries and scheduled jobs).
stats.enqueued # => 1051
