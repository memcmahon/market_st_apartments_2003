class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    total = @units.sum do |apartment|
      apartment.monthly_rent
    end
    total / @units.length.to_f
  end

  def renters
    @units.map { |unit| unit.renter.name if unit.renter }.compact
  end

  def rented_units
    @units.find_all do |apartment|
      apartment.renter != nil
    end
  end

  def renter_with_highest_rent
    priciest_unit = rented_units.max_by do |apartment|
      apartment.monthly_rent
    end
    priciest_unit.renter
  end


  def units_by_number_of_bedrooms
    units_by_bedrooms = Hash.new { |hash, key| hash[key] = [] }
    units.each do |unit|
      units_by_bedrooms[unit.bedrooms] << unit.number
    end
    units_by_bedrooms
  end

# ITERATION 4

  def annual_breakdown
    breakdown = {}
    rented_units.each do |apartment|
      breakdown[apartment.renter.name] = apartment.monthly_rent * 12
    end
    breakdown
  end

  def rooms_by_renter
    rooms = {}
    rented_units.each do |unit|
      rooms[unit.renter] = {bedrooms: unit.bedrooms, bathrooms: unit.bathrooms}
    end
    rooms
  end
end
