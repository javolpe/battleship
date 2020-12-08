require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
  end


  def place_ship(boat)
    @ship = boat
  end


  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

end
