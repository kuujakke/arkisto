app_path = ENV['RAILS_ROOT']

working_directory app_path

pid "#{app_path}/tmp/pids/unicorn.pid"

listen ENV['LISTEN_ON']

stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

worker_processes ENV['WORKER_PROCESSES'].to_i

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end

timeout 30

GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

preload_app true
 
before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    puts "Found existing unicorn PID"
    begin
      pid = File.read(old_pid).to_i
      File.delete(old_pid)
      Process.kill("QUIT", pid)
      puts "shut down previous unicorn (#{pid})"
    rescue Errno::ENOENT, Errno::ESRCH
      puts "was already dead"
    end
  end
  puts "unicorn started"
  sleep 5
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
