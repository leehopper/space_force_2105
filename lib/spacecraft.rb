class Spacecraft
  attr_reader :name, :fuel

  def initialize(ship)
    @name = ship[:name]
    @fuel = ship[:fuel]
  end
end
