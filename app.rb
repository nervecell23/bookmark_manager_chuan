require 'sinatra/base'
require_relative './lib/bookmark'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks/new' do
    new_url = params[:url]
    new_title = params[:title]
    Bookmark.create(new_title, new_url)
    # use pg to add entries to database
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    id = params[:id]
    Bookmark.delete(id)
    redirect '/bookmarks'
  end

  # input updated title/url in the page
  get '/bookmarks/:id/edit' do
    id = params[:id]
    @searched_bookmark = Bookmark.find(id)
    erb(:'bookmarks/update')
  end

  post '/bookmarks/update/:id' do
    Bookmark.update(params[:id], params[:modified_title], params[:modified_url])
    redirect '/bookmarks'
  end






  run! if app_file == $0
end
