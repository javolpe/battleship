require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'

class Computer
  attr_accessor :board

  attr_reader   :name

  def initialize(name)
    @name = name
    @board = Board.new
  end

  def computer_places_cruiser
    result = [1,2].shuffle
    computer_cruiser_coordinates = []
    coordinate_array = board.cells.keys

    if result[0] == 1
      first_coordinate  = coordinate_array.shuffle[0]
      second_coordinate = "#{first_coordinate[0]}#{(first_coordinate[1].to_i + 1)}"
      third_coordinate  = "#{first_coordinate[0]}#{first_coordinate[1].to_i + 2}"
      computer_cruiser_coordinates << first_coordinate
      computer_cruiser_coordinates << second_coordinate
      computer_cruiser_coordinates << third_coordinate
   else
      first_coordinate  = coordinate_array.shuffle[0]
      second_coordinate = first_coordinate[0].next + first_coordinate[1]
      third_coordinate  = first_coordinate[0].next.next + first_coordinate[1]
      computer_cruiser_coordinates << first_coordinate
      computer_cruiser_coordinates << second_coordinate
      computer_cruiser_coordinates << third_coordinate
    end

    cruiser = Ship.new("comp_cruiser", 3)

    if board.place(cruiser, computer_cruiser_coordinates) == false
      computer_places_cruiser
    else
      p "==============COMPUTER BOARD=============="
      p board.render(true)
    end
  end

  def computer_places_submarine
    result = [1,2].shuffle
    computer_submarine_coordinates = []
    coordinate_array = board.cells.keys

    if result[0] == 1
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = "#{first_coordinate[0]}#{first_coordinate[1].to_i + 1}"
      computer_submarine_coordinates << first_coordinate
      computer_submarine_coordinates << second_coordinate
    else
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = first_coordinate[0].next + first_coordinate[1]
      computer_submarine_coordinates << first_coordinate
      computer_submarine_coordinates << second_coordinate
    end

    submarine = Ship.new("comp_submarine", 2)

    if board.place(submarine, computer_submarine_coordinates) == false
      computer_places_submarine
    else
      p "==============COMPUTER BOARD=============="
      p board.render(true)
    end
  end

end
