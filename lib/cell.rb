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

  hit = "H"
  miss = "M"
  sunk = "X"
  user_unhit_ship = "S"
  user_empty_not_fired_upon = "."
  computer_cell_not_fired_upon = "."

  # def render(user = false)
  #   if user == false && empty?
  #     "."
  #   elsif user == true && empty?
  # end
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
require 'pry'; binding.pry
