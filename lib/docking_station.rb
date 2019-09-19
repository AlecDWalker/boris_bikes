require_relative 'bike'
class DockingStation
DEFAULT_CAPACITY = 20
  attr_reader :bikes , :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike not working' if @bikes[-1].broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Bike dock full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
