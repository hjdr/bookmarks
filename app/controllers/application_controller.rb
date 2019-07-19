require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './app/models/Bookmark.rb'
require './app/models/comments.rb'
require './database_connection_setup.rb'

class ApplicationManager < Sinatra::Base

  configure do
    enable :sessions, :method_override
    set :views, "app/views"
    set :public_dir, "public"
    register Sinatra::Flash
  end

  get '/'  do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmark_list = Bookmark.list
    erb(:bookmarks)
  end

  get '/create-bookmarks' do
    erb(:create_bookmarks)
  end

  post '/bookmarks-added' do
    flash[:notice] = 'Incorrect format! Please ensure the domain is predicated with -> https://www.' unless Bookmark.create(url: params[:url], title: params[:title])
    redirect('/')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:update_bookmarks)
    
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb(:'comments/new')
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect('/bookmarks')
  end

  run! if app_file == $0

end
