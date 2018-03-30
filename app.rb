require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/posts' do
    @links = Link.all
    erb(:index)
  end

  post '/posts/create' do
    Link.create(url: params['url'], title: params['title'])
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new)
  end

  run! if app_file == $0
end
