require 'csv'

class FileIO
  def self.read_csv(path)
    CSV.read(path, headers: true, header_converters: :symbol).map(&:to_h)
  end
end
