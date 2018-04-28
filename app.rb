require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './lib/comment'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:"links/index")
  end

  get '/links/new' do
    erb(:"links/new")
  end

  post '/links' do
    link = Link.create(url: params['url'], title: params['title'])
    flash[:notice] = "You must submit a valid URL" unless link
    redirect '/links'
  end

  post "/links/:id/delete" do
    Link.destroy(params['id'])
    redirect '/links'
  end

  get '/links/:id/edit' do
    @link = Link.find(params['id'])
    erb(:"links/edit")
  end

  post '/links/:id/update' do
    Link.update(params['id'], params)
    redirect '/links'
  end

  get '/links/:id/comments/new' do
    @link = Link.find(params['id'])
    erb(:"comments/new")
  end

  post '/links/:id/comments' do
    comment = Comment.create(link_id: params['id'], text: params['text'])
    redirect '/links'
  end

  run! if app_file == $0
end
