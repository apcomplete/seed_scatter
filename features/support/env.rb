require 'aruba/cucumber'

#taken from thoughtbot's factory_girl_rails config - https://github.com/thoughtbot/factory_girl_rails
Before do
  @aruba_timeout_seconds = 3600
end

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
    set_env('JAVA_OPTS', "-d32 #{ENV['JAVA_OPTS']}") # force jRuby to use client JVM for faster startup times
  end
end if RUBY_PLATFORM == 'java'
