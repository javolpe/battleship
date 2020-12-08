require './lib/ship'

class Cell
  attr_accessor :received_shot

  attr_reader   :coordinate,
                :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @received_shot = false
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

  def fired_upon?
    @received_shot
  end

  def fire_upon
    @received_shot = true
      if @ship.nil? == false
        ship.hit
      end
  end


end
