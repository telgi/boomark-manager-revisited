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

  post '/links' do
    link = Link.create(id: params['id'], url: params['url'], title: params['title'])
    flash[:notice] = "You must submit a valid URL" unless link
    redirect '/links'
  end

  get '/links/new' do
    erb(:new)
  end

  post "/links/delete" do
    Link.destroy(params['id'])
    redirect '/links'
  end

  get '/links/:id' do
    @link = Link.find(params['id'])
    erb(:edit)
  end

  post '/links/edit' do
    Link.update(params['id'], params)
    redirect '/links'
  end

  run! if app_file == $0
end
