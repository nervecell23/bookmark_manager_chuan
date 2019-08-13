require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks' do

  end


  post '/add_url' do
    # use pg to add entries to database
    redirect '/'
  end


  run! if app_file == $0
end
