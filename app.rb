require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/links' do
    @links = Link.all
    erb(:index)
  end

  post '/links/create' do
    link = Link.create(url: params['url'], title: params['title'])
    flash[:notice] = "You must submit a valid URL" unless link
    redirect '/links'
  end

  get '/links/new' do
    erb(:new)
  end

  post '/links/destroy' do
    Link.delete(params['id'])
    redirect '/links'
  end

  run! if app_file == $0
end
