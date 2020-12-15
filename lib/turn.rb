class Turn

  def computer_places_cruiser
    result = [1,2].shuffle
    computer_cruiser_coordinates = []
    coordinate_array = computer_board.cells.keys

    if result[0] == 1
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = first_coordinate[0] + (first_coordinate[1] + 1)
      third_coordinate = first_coordinate[0] + (first_coordinate[1] + 2)
      computer_cruiser_coordinates << first_coordinate
      computer_cruiser_coordinates << second_coordinate
      computer_cruiser_coordinates << third_coordinate
   else
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = (first_coordinate[0].ord + 1) + first_coordinate[1]
      third_coordinate = (first_coordinate[0].ord + 2) + first_coordinate[1]
      computer_cruiser_coordinates << first_coordinate
      computer_cruiser_coordinates << second_coordinate
      computer_cruiser_coordinates << third_coordinate
    end

    cruiser = Ship.new(cruiser, 3)

    if computer_board.place(cruiser, computer_cruiser_coordinates) == false
      computer_places_cruiser
    end
    p computer_board.render(true)
  end

  def computer_places_submarine
    result = [1,2].shuffle
    computer_submarine_coordinates = []
    coordinate_array = board.cells.keys

    if result[0] == 1
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = first_coordinate[0] + (first_coordinate[1] + 1)
      computer_submarine_coordinates << first_coordinate
      computer_submarine_coordinates << second_coordinate
    else
      first_coordinate = coordinate_array.shuffle[0]
      second_coordinate = (first_coordinate[0].ord + 1) + first_coordinate[1]
      computer_submarine_coordinates << first_coordinate
      computer_submarine_coordinates << second_coordinate
    end

    submarine = Ship.new(submarine, computer_submarine_coordinates)

    if computer_board.place(submarine, computer_submarine_coordinates) == false
      computer_places_submarine
    end
    p computer_board.render(true)
  end

  def computer_fires_shot
    valid_shots = []
    user_board.cells.each do |cell|
      if cell.received_shot == false
        valid_shots << cell
      end
    end
    valid_shots = valid_shots.shuffle
    current_shot = valid_shots[0]
    user_board.current_shot.fire_upon
  end


  def user_takes_shot
    p "Enter the coordinate for your shot:"
    p "> "
    shot = gets.chomp.upcase


    if user_board.cells.key.include?(shot) && computer_board.cells["#{shot}"].received_shot == false
      p "FIRE!"
    else
      p "Please enter a valid coordinate:"
      user_takes_shot
    end
  end







end
