require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:database.sqlite3"

get "/" do 
	erb :index
end

get "/blog" do
	erb :blog
end

get "/myprofile" do
	erb :myprofile
end

get "/profiles" do 
	erb :profiles
end

get "/signin" do
	erb :signin
end
