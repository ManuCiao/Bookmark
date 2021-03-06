ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    redirect 'links/login'
  end

  get '/links/login' do
    @user = User.new
    erb :'links/register'
  end

  post '/add_user_data' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to("/links")
    else
      flash.now[:error] = "Password and Verify Password are not matching!"
      erb :'links/register'
    end
  end

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
