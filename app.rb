require "sinatra"
require "sinatra/activerecord"
require "./models"

enable :sessions
set :database, "sqlite3:database.sqlite3"

# THE ROUTES FOR WHEN USERS TO GO A SPECIFIC URL

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

get "/login" do
	erb :login
end

get "/signup" do
	erb :signup
end

get '/logout/?' do
	session[:user_id] = nil
	"you are now logged out"
end

# WHEN USERS POST FORMS

post '/signup' do
  User.create(
    username: params[:username],
    password: params[:password],
  )
  "you are now signed up, go to the login page to login"
end

# Sign-in button/activate session
post "/login" do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    "you are now logged in"
  else
  	"your password is incorrect"
  end
end

# When user clicks the upload_post button
post "/blog" do
	Post.create(:subject => params[:subject], :content => params[:content])
	@posts = Post.all
	erb :blog
end


