require './lib/artist'
require './lib/photograph'
require './lib/curator'

RSpec.describe Artist do
  let(:attributes) { {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
  } }

  let(:artist) { Artist.new(attributes) }

  it 'exists' do
    expect(artist).to be_an_instance_of(Artist)
  end

  it 'hash attributes' do
    expect(artist.id).to eq("2")
    expect(artist.name).to eq("Ansel Adams")
    expect(artist.born).to eq("1902")
    expect(artist.died).to eq("1984")
    expect(artist.country).to eq("United States")
  end

end
