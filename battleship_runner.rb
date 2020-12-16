require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/game'

user = Player.new("John Connor")
comp = Computer.new("Skynet")

game = Game.new(user, comp)

game.start
