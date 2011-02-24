require 'rubygems'
require 'bundler'

Bundler.require :scheduler

require 'os_functions'

include OsFunctions

def say line
  if is_mac?
    system "say \"#{line}\""
  elsif is_linux?
    system "espeak \"#{line}\""
  end
end

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m', :first_in => '1s' do
  lines = File.readlines 'lines.txt'
  lines.empty? and return
  say lines[rand(lines.size)]
end

scheduler.join

