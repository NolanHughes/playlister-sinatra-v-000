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
    @song = Song.create(name: params[:Name])
  end

  get '/songs/:slug' do
    binding.pry
    if @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

end
