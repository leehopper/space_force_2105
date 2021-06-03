require 'rspec'
require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

describe Flotilla do
  before (:each) do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @daedalus.add_requirement({astrophysics: 6})
    @daedalus.add_requirement({quantum_mechanics: 3})
    @odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    @odyssey.add_requirement({operations: 6})
    @odyssey.add_requirement({maintenance: 3})
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    @kathy = Person.new('Kathy Chan', 10)
    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    @polly = Person.new('Polly Parker', 8)
    @polly.add_specialty(:operations)
    @polly.add_specialty(:maintenance)
    @rover = Person.new('Rover Henriette', 1)
    @rover.add_specialty(:operations)
    @rover.add_specialty(:maintenance)
    @sampson = Person.new('Sampson Edwards', 7)
    @sampson.add_specialty(:astrophysics)
    @sampson.add_specialty(:quantum_mechanics)
  end

  it 'exists' do
    expect(@seventh_flotilla).to be_a(Flotilla)
  end

  it 'attributes' do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(@seventh_flotilla.personnel).to eq([])
    expect(@seventh_flotilla.ships).to eq([])
  end

  it 'adds ships' do
    @seventh_flotilla.add_ship(@daedalus)

    expect(@seventh_flotilla.ships).to eq([@daedalus])
  end

  it 'adds personnel' do
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.personnel).to eq([@kathy, @polly, @rover, @sampson])
  end

  it 'returns recommended personnel' do
    @seventh_flotilla.add_ship(@daedalus)
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.recommend_personnel(@daedalus)).to eq([@kathy, @sampson])
  end

  it 'returns recommended personnel for new ship' do
    @seventh_flotilla.add_ship(@daedalus)
    @seventh_flotilla.add_ship(@odyssey)
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.recommend_personnel(@odyssey)).to eq([@polly])
  end

  it 'returns personnel by ship' do
  @seventh_flotilla.add_ship(@daedalus)
  @seventh_flotilla.add_ship(@odyssey)
  @seventh_flotilla.add_personnel(@kathy)
  @seventh_flotilla.add_personnel(@polly)
  @seventh_flotilla.add_personnel(@rover)
  @seventh_flotilla.add_personnel(@sampson)

  expect(@seventh_flotilla.personnel_by_ship).to eq({ @daedalus=> [@kathy, @sampson], @odyssey=> [@polly] })
  end

  xit 'returns ready ships' do
    prometheus = Spacecraft.new({name: 'Odyssey', fuel: 300})
    prometheus.add_requirement({operations: 6})
    prometheus.add_requirement({maintenance: 3})
    @seventh_flotilla.add_ship(@daedalus)
    @seventh_flotilla.add_ship(prometheus)
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)

    expect(@seventh_flotilla.ready_ships(100)).to eq(@daedalus)
  end
end
