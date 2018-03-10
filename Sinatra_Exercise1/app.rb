
require "sinatra"
require "rubygems"

enable :sessions

get '/' do
  request.cookies["name"] && request.cookies["password"] && request.cookies["email"]
  erb :info
end

post '/info' do
  @email = params[:email]
  @password = params[:password]
  @name = params[:name]
  @params = params

  if (@email.length > 0) && (@password.length > 0) && (@name.length > 0)
  response.set_cookie("email", value: @email)
  response.set_cookie("password", value: @cookie_value)

  redirect '/greet'

  else
    redirect '/info'
end
end
