require 'rspec'
require './lib/artist'

RSpec.describe Artist do
  before :each do
    @attributes ={
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist_1 = Artist.new(@attributes)
  end
  it "exists" do

    expect(@artist_1).to be_an_instance_of(Artist)
  end

  it "has attributes" do

    expect(@artist_1.id).to eq("2")
    expect(@artist_1.name).to eq("Ansel Adams")
    expect(@artist_1.born).to eq("1902")
    expect(@artist_1.died).to eq("1984")
    expect(@artist_1.country).to eq("United States")
  end
end
