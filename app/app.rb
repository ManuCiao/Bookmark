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
    link = Link.create(url: params[:url],
                      title: params[:title])
    params[:tags].split.each do |new_tag|
      link.tags << Tag.create(tag: new_tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags' do
    redirect "/tags/#{params[:filter]}"
  end

  get '/tags/:filter' do
    tag = Tag.first(tag: params[:filter])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
