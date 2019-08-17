# README



```
[Unit]
Description=APP Puma HTTP Server
After=syslog.target network.target redis-server.service postgresql.service

[Service]
# Foreground process (do not use --daemon in ExecStart or config.rb)
Type=simple

# Preferably configure a non-privileged user
User=rubyworker

# The path to the your application code root directory.
# Also replace the "<YOUR_APP_PATH>" place holders below with this path.
# Example /home/username/myapp
WorkingDirectory=/home/rubyworker/APP

# Helpful for debugging socket activation, etc.
# Environment=PUMA_DEBUG=1

# SystemD will not run puma even if it is in your path. You must specify
# an absolute URL to puma. For example /usr/local/bin/puma
# Alternatively, create a binstub with `bundle binstubs puma --path ./sbin` in the WorkingDirectory
ExecStart=/home/rubyworker/.rvm/gems/ruby-2.6.3-jemalloc/wrappers/bundle exec pumactl -F config/puma/production.rb start
ExecStop=/home/rubyworker/.rvm/gems/ruby-2.6.3-jemalloc/wrappers/bundle exec pumactl -F config/puma/production.rb stop
ExecReload=/home/rubyworker/.rvm/gems/ruby-2.6.3-jemalloc/wrappers/bundle exec pumactl -F config/puma/production.rb phased-restart

TimeOut=15
Restart=always

[Install]
WantedBy=multi-user.target
```
