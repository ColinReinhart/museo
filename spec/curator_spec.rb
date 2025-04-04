require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do
  let(:curator) { Curator.new }

  it 'exists' do
    expect(curator).to be_an_instance_of(Curator)
  end

  it 'has attributes' do
    expect(curator.photos).to be_an(Array)
    expect(curator.artists).to be_an(Array)
  end

  let(:photo_1_attributes) {{
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "1",
    year: "1954"
  }}

  let(:photo_1) { Photograph.new(photo_1_attributes) }

  let(:photo_2_attributes) {{
    id: "2",
    name: "Moonrise, Hernandez",
    artist_id: "2",
    year: "1941"
  }}

  let(:photo_2) { Photograph.new(photo_2_attributes) }

  let(:p3attributes) {{
    id: "3",
    name: "Identical Twins, Roselle, New Jersey",
    artist_id: "3",
    year: "1967"
  }}

  let(:photo_3) { Photograph.new(p3attributes) }

  let(:p4attributes) {{
    id: "4",
    name: "Monolith, The Face of Half Dome",
    artist_id: "3",
    year: "1927"
  }}

  let(:photo_4) { Photograph.new(p4attributes) }

  let(:a1attributes) {{
    id: "1",
    name: "Henri Cartier-Bresson",
    born: "1908",
    died: "2004",
    country: "France"
  }}

  let(:artist_1) { Artist.new(a1attributes)}

  let(:a2attributes) {{
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
  }}

  let(:artist_2) { Artist.new(a2attributes)}

  let(:a3attributes) {{
    id: "3",
    name: "Diane Arbus",
    born: "1923",
    died: "1971",
    country: "United States"
  }}

  let(:artist_3) { Artist.new(a3attributes)}

    before(:each) do
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)
    end

  it 'can add artists and photos' do
    expect(curator.photos.count).to eq(4)
    expect(curator.artists.count).to eq(3)
  end

  it 'has a photographs by artist method' do
    expect(curator.photographs_by_artist).to be_a(Hash)
    expect(curator.photographs_by_artist.keys).to eq([artist_1, artist_2, artist_3])
    expect(curator.photographs_by_artist.values).to be_a(Array)
  end

  it 'has a artists_with_multiple_photographs method' do
    expect(curator.artists_with_multiple_photographs).to be_an(Array)
    expect(curator.artists_with_multiple_photographs).to eq([[artist_3]])
  end

  it 'has a method photographs_taken_by_artists_from(string)' do
    expect(curator.photographs_taken_by_artists_from("United States")).to be_an(Array)
    expect(curator.photographs_taken_by_artists_from("United States")).to eq([photo_2, photo_3, photo_4])
  end

  it 'can load_photographs(file)' do
    curator.load_photographs('./data/photographs.csv')

    expect(curator.photos).to be_an(Array)
    expect(curator.photos.first).to be_a(Photograph)
    expect(curator.photos.count).to be > 4
  end

  it 'can load_artists(file)' do
    curator.load_artists('./data/artists.csv')

    expect(curator.artists).to be_an(Array)
    expect(curator.artists.first).to be_a(Artist)
    expect(curator.artists.count).to be > 3
  end

  it 'has method photographs_taken_between(range)' do
    expect(curator.photographs_taken_between(1950..1965)).to be_an(Array)
    expect(curator.photographs_taken_between(1950..1965)).to eq([photo_1])
  end

  it 'can find artist by id' do
    expect(curator.find_artist_by_id("3")).to eq(artist_3)
  end

  it 'has method artists_photographs_by_age(artist)' do
    diane_arbus = curator.find_artist_by_id("3")

    expect(curator.artists_photographs_by_age(diane_arbus)).to be_a(Hash)
    expect(curator.artists_photographs_by_age(diane_arbus)).to eq({44=>"Identical Twins, Roselle, New Jersey", 4=>"Monolith, The Face of Half Dome"})
  end

end
