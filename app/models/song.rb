class Song < ActiveRecord::Base
  has_many :genres, through: :song_genres
  has_many :song_genres
  belongs_to :artist

  def slug
    @correct_name = self.name
    @correct_name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslugged = slug.gsub("-", " ").split.collect {|word| word.capitalize}.join(" ")
    find_by(name: unslugged)
  end
end
