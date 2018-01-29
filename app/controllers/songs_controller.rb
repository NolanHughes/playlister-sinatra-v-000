class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(name: params[:name])
    @artist = Artist.create(name: params[:artist_name])


    redirect to '/songs/:slug'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

end
