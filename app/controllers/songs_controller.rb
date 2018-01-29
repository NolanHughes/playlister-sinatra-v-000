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
    @song = Song.new(name: params[:name])
    @artist = Artist.create(name: params[:artist_name])
    binding.pry
    @genre = Genre.find_by_id(params[:genres.first])

    redirect to '/songs/:slug'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

end
