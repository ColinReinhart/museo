class Photograph
  attr_reader :id,
              :name,
              :artist_id,
              :year

  def initialize(argument)
    @id = argument[:id]
    @name = argument[:name]
    @artist_id = argument[:artist_id]
    @year = argument[:year]
  end
end
