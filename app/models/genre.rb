class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslugged = slug.gsub("-", " ").split.collect {|word| word.capitalize}.join(" ")
    find_by(name: unslugged)
  end
end
