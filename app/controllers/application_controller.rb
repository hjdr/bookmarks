require 'sinatra/base'
require './app/models/Bookmark.rb'

class ApplicationManager < Sinatra::Base

  configure do
    enable :session
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/'  do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmark_list = Bookmark.list
    erb(:bookmarks)
  end

  get '/create-bookmarks' do
    erb (:create_bookmarks)
  end

  post '/bookmarks-added' do
    Bookmark.create(params[:url])
    redirect '/'
  end

  run! if app_file == $0

end
