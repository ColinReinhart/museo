require_relative './file_io'

class Curator
  attr_reader :photos, :artists
  def initialize
    @photos = []
    @artists = []
  end

  def add_artist(artist)
    @artists << artist
  end

  def add_photograph(photo)
    @photos << photo
  end

  def photographs_by_artist
    hash = Hash.new
    artists.each { |artist| hash[artist] = photos.select { |photo| artist.id == photo.artist_id } }
    hash
  end

  def artists_with_multiple_photographs
    artists_with_multiple_photos = []
    hash = Hash.new(0)
    photos.each {  |photo| hash[photo.artist_id] += 1 }
    hash.each do |k,v|
      if v > 1
        artists_with_multiple_photos << artists.select { |artist|  artist.id == k }
      end
    end
    artists_with_multiple_photos
  end

  def photographs_taken_by_artists_from(country)
    photos_from_country = []
    photographs_by_artist.select { |a, p| photos_from_country << p if a.country == country }
    photos_from_country.flatten
  end

  def load_photographs(file)
    FileIO.read_csv(file).each do |photo_data|
      @photos << Photograph.new(photo_data)
    end
  end

  def load_artists(file)
    FileIO.read_csv(file).each do |artist_data|
      @artists << Artist.new(artist_data)
    end
  end

  def photographs_taken_between(range)
    photos_in_range = []
    range_array = range.to_a

    photos.each { |photo| photos_in_range << photo if range_array.include?(photo.year.to_i) }
    photos_in_range
  end

  def find_artist_by_id(id)
    artists.find { |artist| artist.id == id }
  end

  def artists_photographs_by_age(artist)
    age_photos = {}

    photos.each do |photo|
      if photo.artist_id == artist.id
        age_photos[photo.year.to_i - artist.born.to_i] = photo.name
      end
    end
    age_photos
  end

end
