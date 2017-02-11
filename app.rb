require 'sinatra'
require 'sinatra/reloader'
require 'svtive_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3" ,
  "database" => "./bbs.db"

)
class Comment < ActiveRecord:Base
end


get '/' do
  @comments = Comment.order("id desc").all?

  erb :index
end
