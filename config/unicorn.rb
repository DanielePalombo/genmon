# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/genmon/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/tmp/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/genmon/current/log/unicorn.log"
stdout_path "/var/www/genmon/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[genmon].sock"
listen "/tmp/unicorn.genmon.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
