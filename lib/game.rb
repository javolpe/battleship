require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/computer'

class Game
  attr_reader :user,
              :comp

   def initialize(user, comp)
    @user = user
    @comp = comp
   end

   def user_fires
     shot = user.user_takes_shot
     if comp.board.cells[shot].received_shot == false
       p "FIRE!"
       comp.board.cells[shot].fire_upon
     else
       user_fires
     end
  end

  def computer_fires
    valid_shots = []
    user.board.cells.keys.each do |cell|
      if user.board.cells[cell].received_shot == false
        valid_shots << cell
      end
    end
    shot = valid_shots.shuffle[0]
    user.board.cells[shot].fire_upon
    p "My shot on #{shot}."
  end


  # def start
  #   p "Welcome to BATTLESHIP"
  #   p "Enter p to play. Enter q to quit."
  #   p "> "
  #   play = gets.chomp.downcase
  #
  #   if play == 'p'
  #     play
  #   elsif play == 'q'
  #     exit_game
  #   else
  #     start
  #   end
  # end

  # if play == 'q'
  #
  # end

end

require 'pry'; binding.pry
