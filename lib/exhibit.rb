class Exhibit
  attr_reader :name, :cost

  def initialize(attr_hash)
    @name = attr_hash[:name]
    @cost = attr_hash[:cost]
  end
end
