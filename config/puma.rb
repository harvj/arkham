directory "/var/www/arkham/current"

environment ENV.fetch("RAILS_ENV", "production")

threads_count = ENV.fetch("RAILS_MAX_THREADS", 3).to_i
threads threads_count, threads_count

workers ENV.fetch("WEB_CONCURRENCY", 2)

preload_app!

bind "unix:///var/www/arkham/shared/tmp/sockets/puma.sock"

pidfile "/var/www/arkham/shared/tmp/pids/puma.pid"
state_path "/var/www/arkham/shared/tmp/pids/puma.state"

stdout_redirect "/var/www/arkham/shared/log/puma.stdout.log",
                "/var/www/arkham/shared/log/puma.stderr.log",
                true

plugin :tmp_restart

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
