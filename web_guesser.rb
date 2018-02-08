require 'sinatra'
require 'sinatra/reloader'

num = rand(101)
get '/' do
  "THE SECRET NUMBER is #{num}."
end
