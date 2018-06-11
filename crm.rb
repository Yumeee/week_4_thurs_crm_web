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

get '/contacts/new' do
  erb(:new)
end

get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
