require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'

# db setup
before do
  @db = PG.connect(dbname: 'memetubes', host: 'localhost')
end

after do
  @db.close
end

#Home
get '/' do
  redirect to '/videos'
end

#Index
get '/videos' do
  sql = 'SELECT * FROM memes'
  @videos = @db.exec(sql)

  erb :index
end

#New
get '/videos/new' do
  erb :new
end

#Create
post '/videos' do
  sql = "INSERT INTO memes (title, url, genre, description) VALUES ('#{params[:title]}', '#{params[:url]}', '#{params[:genre]}', '#{params[:description]}')"
  @db.exec(sql)

  redirect to '/videos'
end

#Show
get '/videos/:id' do
  sql = "SELECT * FROM memes WHERE id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :show
end

#Show
get '/videos/search' do
  sql = "SELECT * FROM memes WHERE title LIKE '#{params[:search]}%'"
  @video = @db.exec(sql).first

  erb :search
end

#Edit
get '/videos/:id/edit' do
  sql = "SELECT * FROM memes WHERE id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :edit
end

#Update
post '/videos/:id' do
  sql = "UPDATE memes SET title = '#{params[:title]}', url = '#{params[:url]}', genre = '#{params[:genre]}', description = '#{params[:description]}' WHERE id = #{params[:id]}"
  @db.exec(sql)

  redirect to "/videos/#{params[:id]}"
end

#Delete
post '/videos/:id/delete' do
   "Hello World"
  sql = "DELETE from memes WHERE id = #{params[:id]}"
  @db.exec(sql)

  redirect to '/videos'
end



