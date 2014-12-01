require 'pry'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

require_relative 'models/contact'

# before do
#   contact_attributes = [
#     { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
#     { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
#     { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
#     { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
#     { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
#     { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
#     { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' }
#   ]
#
#   @contacts = contact_attributes.map do |attr|
#     Contact.new(attr)
#   end
# end

get '/' do
  @query = params[:query]
  page_length = 5
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
  # save contact to db
  redirect '/'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end
