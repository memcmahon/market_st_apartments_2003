require './spec/test_helper.rb'
require './lib/renter'
require './lib/apartment'

RSpec.describe 'Iteration 1' do
  before :each do
    @jessie = Renter.new("Jessie")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  it '1. Renter Instantiation' do
    expect(Renter).to respond_to(:new).with(1).argument
    expect(@jessie).to be_an_instance_of(Renter)
  end

  it '2. Renter #name' do
    expect(@jessie).to respond_to(:name).with(0).argument
    expect(@jessie.name).to eq("Jessie")
  end

  it '3. Apartment Instantiation' do
    expect(Apartment).to respond_to(:new).with(1).argument
    expect(@a1).to be_an_instance_of(Apartment)
  end

  it '4. Apartment #number' do
    expect(@a1).to respond_to(:number).with(0).argument
    expect(@a1.number).to eq("A1")
  end

  it '5. Apartment #monthly_rent' do
    expect(@a1).to respond_to(:monthly_rent).with(0).argument
    expect(@a1.monthly_rent).to eq(1200)
  end

  it '6. Apartment #bathrooms' do
    expect(@a1).to respond_to(:bathrooms).with(0).argument
    expect(@a1.bathrooms).to eq(1)
  end

  it '7. Apartment #bedrooms' do
    expect(@a1).to respond_to(:bedrooms).with(0).argument
    expect(@a1.bedrooms).to eq(1)
  end

  it '8. Apartment #renter' do
    expect(@a1).to respond_to(:renter).with(0).argument
    expect(@a1.renter).to eq(nil)
  end

  it '9. Apartment #add_renter' do
    expect(@a1).to respond_to(:add_renter).with(1).argument
    @a1.add_renter(@jessie)
    expect(@a1.renter).to eq(@jessie)
  end
end
