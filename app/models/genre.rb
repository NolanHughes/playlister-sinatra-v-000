class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      if song.slug.include?(slug)
        Song.find_by(name: song.name)
      end
    end

  end
  
end
