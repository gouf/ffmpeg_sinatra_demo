require 'sinatra'
require './main'

class MyApp < Sinatra::Base
  get '/?' do
    @images = images
    erb :index
  end

  get '/encode' do
    screenshot
    redirect '/'
  end
end
