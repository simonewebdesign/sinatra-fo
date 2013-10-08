require 'sinatra'

get '/' do
  "<h1>Hello, World!</h1> Please read <a href='about'>about us</a>."
end

get '/about' do
  "About us :)"
end

get '/erb' do
  erb :index
end
