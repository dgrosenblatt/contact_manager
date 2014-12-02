require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

require_relative 'models/contact'

def page_length
  10
end

get '/' do
  @query = params[:query]
  @page = params[:page] || 1
  @page = @page.to_i
  offset = (@page - 1) * page_length
  @total_pages = Contact.count / page_length
  @total_pages += 1 if Contact.count % page_length != 0
  if @query
    @contacts = Contact.where("first_name = ? or last_name = ?", @query, @query)
  else
    @contacts = Contact.limit(page_length).offset(offset)
  end
  erb :index
end

get '/contacts/new' do
  erb :'contacts/new'
end

post '/contacts/new' do
  Contact.create({
    first_name: params[:first_name],
    last_name: params[:last_name],
    phone_number: params[:phone_number]
    })
  redirect '/'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end
