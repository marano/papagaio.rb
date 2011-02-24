require 'rubygems'
require 'bundler'

Bundler.require :scheduler

require 'speaker'

include Speaker

scheduler = Rufus::Scheduler.start_new

scheduler.every '15m', :first_in => '1s' do
  lines = File.readlines 'lines.txt'
  lines.empty? and return
  say lines[rand(lines.size)]
end

scheduler.join

