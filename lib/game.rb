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
