require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  enable :sessions  

  get '/posts' do
    @links = Link.all
    erb(:index)
  end

  post '/posts/create' do
    flash[:notice] = "You must submit a valid URL" unless Link.create(url: params['url'], title: params['title'])
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new)
  end

  run! if app_file == $0
end
