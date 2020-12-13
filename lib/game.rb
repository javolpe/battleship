require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class PlayGame
  attr_reader :user,
              :computer
   def initialize(user, computer)
    @user = user
    @computer = computer
   end

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    p "> "
    play = gets.chomp.downcase

    if play == 'p'
      play
    elsif play == 'q'
      exit_game
    else
      start
    end
  end

  if play == 'q'
    break
  end
end




# do we need to change render method to accept user
# and computer, otherwiswe only one board prints
  # play = Board.new.render(@user, @computer)

  # set computer placement- needs te random



#while loop:
#while there is no loser, the game keeps going
#user inputs a move
#we validate move
#make move happen
#store move and results of the move
#computer makes move
#validate computers move
#store computer's move
#show result of both user and computer
#display boards for computer and user
#loop starts over


  #def turn

  #Displaying the boards
  # print both boards
  #"=============COMPUTER BOARD============="
  #"==============PLAYER BOARD=============="


  #state  if it was a miss or a hit


  #Computer choosing a coordinate to fire on * must be random!


  #Reporting the result of the Player’s shot
  #state  if it was a miss or a hit
  #"your shot on #{} was a miss/hit"

  #Reporting the result of the Computer’s shot
  #state  if it was a miss or a hit
  #"my shot on #{} was a miss/hit"

  #end

end
