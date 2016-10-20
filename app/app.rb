ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    @links = Link.new(url: params[:url],
                      title: params[:title])
    tag = Tag.first_or_create(tag: params[:tags])
    @links.tags << tag
    @links.save
    redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end