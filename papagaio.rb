require 'rubygems'
require 'bundler'

Bundler.require

require 'os_functions'

include OsFunctions

def say line
  if is_mac?
    system "say \"#{line}\""
  elsif is_linux?
    system "espeak \"#{line}\""
  end
end

lines = File.readlines 'lines.txt'

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
  lines.empty? and return
  say lines[rand(lines.size)]
end

scheduler.join

