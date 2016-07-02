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

get "/login" do
	erb :login
end

get "/signup" do
	erb :signup
end

get "/login-failed" do
  erb :login_failed
end

get '/logout/?' do
	session[:user_id] = nil
	"you are now logged out"
end

post '/signup' do
  User.create(
    username: params[:username],
    password: params[:password],
  )
end

#Sign-in button/activate session
post "/login" do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    "you are not logged in"
  else
  end
end

# when user clicks the upload_post buttom
post "/blog" do
	Post.create(:title => params[:title], :text => params[:text])
	erb :blog
end


