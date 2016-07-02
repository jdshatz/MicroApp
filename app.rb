require "sinatra"
require "sinatra/activerecord"
require "./models"

enable :sessions
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
# post "/signup" do
# 	User.create(:username => params[:username], :password => params[:password])
# 	redirect :profiles
# 	  @user = User.where(username: params[:username]).first
# 	  if @user != null && @user.password != null 
# 	  	redirect '/'
# 	  elsif @user.username != params[:username]
# 	  	redirect '/signup'
# 	  	flash[:alert] = "Sign-up failed."
# 	end
# end

post '/signup' do
  User.create(
    username: params[:username],
    password: params[:password],
  )

  # flash[:notice] = "You have signed up"
  # redirect "/"
end

get "/login-failed" do
  erb :login_failed
end

#Sign-in button/activate session
# post "/signin" do
# 	@user = User.where(username: params[:username]).first
# 	  if @user != null && @user.password == params[:password] 
# 	  	session[:user_id] = @user.id
# 	  	redirect '/'
# 	  else
# 		redirect '/signin' #Is this redundant, if we don't have a sign-in page?
# 		flash[:alert] = "Sign-in failed."
# 	end
# end

#Sign-in button/activate session
post "/myprofile" do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    # flash[:notice] = "You are signed in"
    redirect "/blog"
  else
    # flash[:error] = "You are not signed in"
    # redirect "/login-failed"
  end
end

# when user clicks the upload_post buttom
post "/blog" do
	Post.create(:title => params[:title], :text => params[:text])
	erb :blog
end


