require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:database.sqlite3"

get "/" do 
  "Hello"
end

get "/blog" do
  "Blog"
end

get "/myprofile" do
  "My Profile"
end

get "/profiles" do 
  "Profiles"
end

get "/signin" do
  "Sign yourself in"
end
