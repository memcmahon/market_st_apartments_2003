require './spec/test_helper'
require './lib/building'
require './lib/apartment'
require './lib/renter'

RSpec.describe 'Iteration 4' do
  before :each do
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @c3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @spencer = Renter.new("Spencer")
    @jessie = Renter.new("Jessie")
    @pearl = Renter.new("Pearl")
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @building.add_unit(@c3)
  end
  
  it '1. Building #annual_breakdown' do
    building = Building.new
    a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    spencer = Renter.new("Spencer")
    jessie = Renter.new("Jessie")
    b2.add_renter(spencer)
    building.add_unit(a1)
    building.add_unit(b2)
    expect(building).to respond_to(:annual_breakdown).with(0).argument
    expect(building.annual_breakdown).to eq({"Spencer" => 11988})
    a1.add_renter(jessie)
    expect(building.annual_breakdown).to eq({"Jessie" => 14400, "Spencer" => 11988})
    c3 = Apartment.new({number: "C3", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(c3)
    expect(building.annual_breakdown).to eq({"Jessie" => 14400, "Spencer" => 11988})
  end

  it '2. Building #rooms_by_renter' do
    expect(@building).to respond_to(:rooms_by_renter).with(0).argument
    expected = {
      @spencer => {bedrooms: @b2.bedrooms, bathrooms: @b2.bathrooms},
      @jessie => {bedrooms: @a1.bedrooms, bathrooms: @a1.bathrooms},
      @pearl => {bedrooms: @c3.bedrooms, bathrooms: @c3.bathrooms}
      }
    expect(@building.rooms_by_renter).to eq({})
    @b2.add_renter(@spencer)
    @a1.add_renter(@jessie)
    @c3.add_renter(@pearl)
    expect(@building.rooms_by_renter).to eq(expected)
  end
end
