class Bike

  attr_reader :condition

  def initialize
    @condition = "Working"
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
      true
  end

end
