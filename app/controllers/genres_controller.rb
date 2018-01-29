class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all

    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genres.find_by_slug(params[:slug])

    erb :'songs/show'
  end

end
