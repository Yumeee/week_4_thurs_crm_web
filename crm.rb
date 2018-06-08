require_relative 'contact'
require 'sinatra'
require 'erb'


get '/home' do
  erb(:index)
end

get '/contacts' do
  @contacts = Contact.all
# In this new route, create an instance variable containing a collection of all the contacts in your database.
  erb(:contacts)
end

after do
  ActiveRecord::Base.connection.close
end
