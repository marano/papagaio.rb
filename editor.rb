require 'rubygems'
require 'bundler'

Bundler.require :editor

require 'erb'

require 'speaker'

include Speaker

set :app_file, __FILE__

get '/' do
  redirect '/lines'
end

get '/lines' do
  erb :lines, :locals => { :lines => lines_from_file }
end

post '/lines' do
  #say params[:body]
  save_to_file([ params[:body] ]  << lines_from_file)
  redirect '/lines'
end

delete '/lines/:linenumber' do
  lines = lines_from_file
  lines.delete_at params[:linenumber].to_i
  save_to_file lines
  redirect '/lines'
end

def save_to_file lines
  File.open('lines.txt', 'w') { |file| file.write lines.join("\n") }
end

def lines_from_file
  lines = []
  File.open 'lines.txt', 'r' do |file|
    while(line = file.gets) do
      lines << line.gsub("\n", "")
    end
  end
  return lines
end

