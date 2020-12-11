require './lib/ship'

class Cell
  attr_accessor :received_shot,
                :ship


  attr_reader   :coordinate



  def initialize(coordinate)
    @coordinate = coordinate
    @received_shot = false

  end


  def place_ship(ship)
    @ship = ship
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


  def render(user = false)
    if empty? == false && ship.sunk? == true
      "X"
    elsif empty? == true && @received_shot == true
      "M"
    elsif empty? == false && @received_shot == true
      "H"
    elsif user == true && empty? == false && @received_shot == false
      "S"
    elsif user == true && @received_shot == false
      "."
    elsif user == false && @received_shot == false
      "."
    end
  end

end
