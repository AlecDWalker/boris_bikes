require_relative 'bike'
class DockingStation

  attr_reader :bikes, :DEFAULT_CAPACITY

  def initialize
    @bikes = []
    @DEFAULT_CAPACITY = 20
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Bike dock full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
