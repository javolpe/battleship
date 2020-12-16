require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/computer'

class Game
attr_accessor :loser

  attr_reader :user,
              :comp

   def initialize(user, comp)
    @user = user
    @comp = comp
    @loser = false
   end

   def start
     p "Welcome to BATTLESHIP"
     p "Enter p to play. Enter q to quit."
      p "> "
     play = gets.chomp.downcase

     if play == "p"
       run_game
     elsif play == "q"
       p "What? You don't want to play anymore?!?!?!"
     else
       p "You need to learn how to type if you want to win this game buddy."
       sleep(2)
       start
     end
   end

   def run_game
     user.user_cruiser_placement
     user.user_submarine_placement
     comp.computer_places_cruiser
     comp.computer_places_submarine
      while @loser == false
        p "==============USER BOARD=============="
        p user.board.render(true)
        p "==============COMPUTER BOARD=============="
        p comp.board.render(true)
        user_fires
        computer_fires
        #display round message
        is_game_over?
      end
      start
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


  def is_game_over?
    if user.has_user_lost? && comp.has_computer_lost?
      p "WOW, you managed to kill each other at the same time."
      p "That literally never happens in BATTLESHIP!!"
      p "Kinda cool but do better next time."
      @loser = true
    elsif comp.has_computer_lost?
      p "#{user.name} is victorious over #{comp.name}"
      p "You have saved humanity from the machines of BATTLESHIP."
      @loser = true
    elsif user.has_user_lost?
      p "#{comp.name} is victorious over #{user.name}"
      p "You have doomed humanity to the machines of BATTLESHIP."
      p "How you gonna lose at BATTLESHIP?!?!?!"
      p "The computer fires randomly with no strategy, that is TERRIBLE!"
      @loser = true
    end
  end

end
