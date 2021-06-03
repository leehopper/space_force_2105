require 'rspec'
require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

describe Flotilla do
  before (:each) do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @daedalus.add_requirement({astrophysics: 6})
    @daedalus.add_requirement({quantum_mechanics: 3})
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
  end

  it 'exists' do
    expect(@seventh_flotilla).to be_a(Flotilla)
  end

  it 'attributes' do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(@seventh_flotilla.ships).to eq([])
  end
end
