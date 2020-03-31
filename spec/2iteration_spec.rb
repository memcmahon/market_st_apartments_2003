require './spec/test_helper'
require './lib/renter'
require './lib/apartment'
require './lib/building'

RSpec.describe 'Iteration 2' do
  before :each do
    @jessie = Renter.new("Jessie")
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  it '1. Building Instantiation' do
    expect(Building).to respond_to(:new).with(0).argument
    expect(@building).to be_an_instance_of(Building)
  end

  it '2. Building #units' do
    expect(@building).to respond_to(:units).with(0).argument
    expect(@building.units).to eq([])
  end

  it '3. Building.add_unit' do
    expect(@building).to respond_to(:add_unit).with(1).argument
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expect(@building.units).to eq([@a1, @b2])
  end

  it '4. Building.renters' do
    expect(@building).to respond_to(:renters).with(0).argument
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expect(@building.renters).to eq([])
    @b2.add_renter(@jessie)
    expect(@building.renters).to eq(["Jessie"])
  end

  it '5. Building.average_rent' do
    expect(@building).to respond_to(:average_rent).with(0).argument
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expect(@building.average_rent).to eq(1099.5)
  end
end
