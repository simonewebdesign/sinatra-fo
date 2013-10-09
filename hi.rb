require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  "About us :)"
end

post '/subscribe' do
  # The HTTP response status code 303 See Other
  # is the correct way to redirect web applications to a 
  # new URI, particularly after an HTTP POST has been performed.
  redirect '/done', 303
end

get '/done' do
  erb :done
end
