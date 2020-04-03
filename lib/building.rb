class Building
  attr_reader :units

  def initialize
    @units = []
  end


  def add_unit(unit)
    @units << unit
  end

  def renters
    # renters = []
    # @units.each do |unit|
    #   if unit.renter != nil
    #     renters << unit.renter.name
    #   end
    # end
    # renters

    # @units.map do |unit|
    #   if unit.renter != nil
    #     unit.renter.name
    #   end
    # end.compact

    # @units.map do |unit|
    #   unit.renter.name if unit.renter != nil
    # end.compact

    # renter_names = []
    # @units.each do |unit|
    #   renter_names << unit.renter.name if unit.renter != nil
    # end
    # renter_names

    rented_units.map do |unit|
      unit.renter.name
    end
  end

  def average_rent
    # sum = 0.0
    # @units.each do |unit|
    #   sum += unit.monthly_rent
    # end
    # sum / @units.length

    sum = @units.sum do |unit|
      unit.monthly_rent
    end
    sum.to_f / @units.length
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter != nil
      # !unit.renter.nil?
    end
  end

  def renter_with_highest_rent
    most_expensive_unit = rented_units.max_by do |unit|
      unit.monthly_rent
    end

    # most_expensive_unit = nil
    # rented_units.each do |unit|
    #   if most_expensive_unit.nil?
    #     most_expensive_unit = unit
    #   elsif unit.monthly_rent > most_expensive_unit.monthly_rent
    #     most_expensive_unit = unit
    #   end
    # end
    # most_expensive_unit

    most_expensive_unit.renter
  end
end
