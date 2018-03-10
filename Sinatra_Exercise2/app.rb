require "sinatra"
require "sinatra/activerecord"
require "./models.rb"

set :database, "sqlite3:myblogdb.sqlite3"


get '/' do
  @posts = Post.all
erb :index
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
end

get '/post/:id' do
@post = Post.find(params[:id])
erb :post_page
end

delete '/post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end
