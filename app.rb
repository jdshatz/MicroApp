require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:database.sqlite3"

get "/" do 
	erb :index
end

get "/blog" do
	@posts = Post.all
	erb :blog
end

get "/myprofile" do
	erb :myprofile
end

get "/profiles" do
	@users = User.all 
	erb :profiles
end

get "/signup" do
	erb :signup
end

# when user clicks the signup button
post "/signup" do
	User.create(:username => params[:username], :password => params[:password])
	redirect :profiles
end

# when user clicks the upload_post buttom
post "/blog" do
	Post.create(:title => params[:title], :text => params[:text])
	erb :blog
end


