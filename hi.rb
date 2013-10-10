require 'sinatra'
require 'pony'

enable :sessions

get '/' do
  erb :index
end

get '/about' do
  "About us :)"
end

post '/subscribe' do
  Pony.mail :to => params[:email],
            :from => "me@example.com",
            :subject => "Thanks for signing my guestbook!",
            :html_body => erb(:email, :layout => false),
            :body => "TODO alternative text for clients who doesn't have HTML"

  # save email to session, for later use
  session[:email] = params[:email]

  # The HTTP response status code "303 See Other"
  # is the correct way to redirect web applications to a 
  # new URI, particularly after an HTTP POST has been performed.
  redirect '/done', 303
end

get '/done' do
  @email = session[:email]
  erb :done
end
