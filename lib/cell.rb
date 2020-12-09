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
  #if there is a ship on a cell and
  #that cell is fired up cell = h
    if empty? == false && @received_shot == true
      "H"

  #if a cell is fired upon and no ship is there
  #render = m
    elsif empty? == true && @received_shot == true
      "M"
  #if a cell contains a ship with health = 0
  #renders as an x
    elsif empty? == false && ship.sunk == true
      "X"
  #if a cell belongs to user board and had Ship
  #and cell has not been fired up renders s
    elsif user == true && empty? == false && @received_shot == false
      "S"

  #if a cell belongs to user board has not been fired upon
  #and does not have ship render .
    elsif user == true && @received_shot == false
      "."

  #if a cell belongs to compter board and has not been
  #fired upon, render as .
    elsif user == false && @received_shot == false
      "."
    end

  end

end
