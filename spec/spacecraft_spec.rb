require 'rspec'
require './lib/spacecraft'

describe Spacecraft do
  before (:each) do
    @aedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
  end

  it 'exists' do
    expect(@aedalus).to be_a(Spacecraft)
  end
end
