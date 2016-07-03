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

# get '/profile_prompt' do
# 	erb :profile_prompt
# end

get '/createprofile' do
	erb :createprofile
end

get '/updateprofile' do
	erb :updateprofile
end

get '/delete_account' do
	erb :delete_account
end

get '/account_deleted' do
	erb :account_deleted
end


def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

# def update_profile
# 	@profile = current_user.profile
# 	@profile.fname = params[:fname]
# 	@profile.lname = params[:lname]
# 	@profile.location = params[:location]
# 	@profile.bio = params[:bio]
# 	@profile.save
# end




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

post '/myprofile' do
	Post.create(message: params[:message], user_id: current_user.id)
	redirect 'myprofile'
end

post '/createprofile' do
	Profile.create(fname: params[:fname], lname: params[:lname], location: params[:location], bio: params[:bio], user_id: params[:user_id])
	redirect '/myprofile'
end

post '/updateprofile' do
	redirect '/myprofile'
end

post '/delete_account' do
  User.delete(
    username: params[:username],
    password: params[:password],
  )
	"You have deleted your account."
	"You can sign back up and start blog with us again! "
end
