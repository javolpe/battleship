class Turn





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
