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
	@anything = User.all 
	erb :profiles
end

get "/signup" do
	erb :signup
end

post "/signup" do
	User.create(:username => params[:username], :password => params[:password])
end


