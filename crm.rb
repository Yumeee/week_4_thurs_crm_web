require_relative 'contact'
require 'sinatra'

get '/home' do
  erb(:index)
end
