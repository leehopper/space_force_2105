class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(name)
    @name = name[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship)
    recommended = []
    @personnel.each do |person|
      ship.requirements.each do |req|
        req.each do | key, value |
          if person.specialties.include?(key) && person.experience >= value
            recommended << person
          end
        end
      end
    end
    recommended.uniq!
    recommended
  end

  def personnel_by_ship
    ship_hash = {}
    @ships.each do |ship|
      ship_hash[ship] = recommend_personnel(ship)
    end
    ship_hash
  end

  def ready_ships(fuel)
    @ships.find_all do |ship|
      crew_skills = (recommend_personnel(ship).flat_map { |person| person.specialties})
      crew_skills.uniq!
      ship_requires = ship.requirements.flat_map { |requirement| requirement.keys }
      ship_requires == crew_skills && ship.fuel >= fuel
    end
  end
end
