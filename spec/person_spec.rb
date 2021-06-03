require 'rspec'
require './lib/person'

describe Person do
  before (:each) do
    @kathy = Person.new('Kathy Chan', 10)
  end

  it 'exists' do
    expect(@kathy).to be_a(Person)
  end

  it 'attributes' do
    expect(@kathy.name).to eq('Kathy Chan')
    expect(@kathy.experience).to eq(10)
    expect(@kathy.experience).to eq([])
  end
end
