require './spec/test_helper'
require './lib/building'
require './lib/apartment'
require './lib/renter'

RSpec.describe 'Iteration 4' do
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
end
