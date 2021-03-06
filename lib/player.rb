require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/computer'

require 'pry'

class Player
  attr_reader   :name,
                :board,
                :cruiser,
                :submarine

  def initialize(name)
    @name      = name
    @board     = Board.new
    @cruiser   = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def user_cruiser_placement
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    p "Lets first place your Cruiser, please choose three connecting locations"
    p "Avoiding diagonals."
    p "==============USER BOARD=============="
    p board.render(true)
    p "Location 1:"
    p "> "
    cruiser_1 = gets.chomp.upcase
    p "Location 2:"
    p ">"
    cruiser_2 = gets.chomp.upcase
    p "Location 3:"
    p ">"
    cruiser_3 = gets.chomp.upcase
    if board.place(@cruiser, [cruiser_1, cruiser_2, cruiser_3]) == false
      p "Improper ship placement"
      sleep(2)
        user_cruiser_placement
    else
      p "==============USER BOARD=============="
      p board.render(true)
    end
  end

  def user_submarine_placement
    p "Great! Now let's place your Submarine, please choose two connecting locations"
    p "Avoiding diagonals and your cruiser."
    p "Location 1:"
    p "> "
    submarine_1 = gets.chomp.upcase
    p "Location 2:"
    p ">"
    submarine_2 = gets.chomp.upcase
    if board.place(@submarine, [submarine_1, submarine_2]) == false
      p "Improper ship placement"
        sleep(2)
        user_submarine_placement
    end
  end

  def user_takes_shot
    p "Enter the coordinate for your shot:"
    p "> "
    shot = gets.chomp.upcase

    if board.cells.keys.include?(shot) == false
      p "Please enter a valid coordinate:"
      sleep(2)
      user_takes_shot
    else
      shot
    end
  end

  def has_user_lost?
    if cruiser.health == 0 && submarine.health == 0
      true
    end
  end
end
