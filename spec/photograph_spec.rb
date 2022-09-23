require 'rspec'
require './lib/photograph'

RSpec.describe Photograph do
  before :each do
    @attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }

    @photograph_1 = Photograph.new(@attributes)
  end
  it "exists" do

    expect(@photograph_1).to be_an_instance_of(Photograph)
  end

  it "has attributes" do

    expect(@photograph_1.id).to eq("1")
    expect(@photograph_1.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    expect(@photograph_1.artist_id).to eq("4")
    expect(@photograph_1.year).to eq("1954")
  end
end
