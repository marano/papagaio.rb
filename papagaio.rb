require 'rubygems'
require 'bundler'

Bundler.require

require 'os_functions'

scheduler = Rufus::Scheduler.start_new

include OsFunctions

lines = File.readlines 'lines.txt'

def say line
  if is_mac?
    system "say \"#{line}\""
  elsif is_linux?
    system "espeak \"#{line}\""
  end
end

scheduler.every '5s' do
  say "alo"
end

scheduler.join

