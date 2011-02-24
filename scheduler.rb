require 'rubygems'
require 'bundler'

Bundler.require

scheduler = Rufus::Scheduler.start_new

scheduler.every '5s' do
  system 'say holy crap!'
end

scheduler.join

