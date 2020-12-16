require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/game'


class GameTest < Minitest::Test

  def test_game_exists
    user = Player.new("User")
    computer = Computer.new("Computer")
    game = Game.new(user, computer)

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    user = Player.new("User")
    computer = Computer.new("Computer")
    game = Game.new(user, computer)

    assert_equal game.user.name, "User"
    assert_equal game.comp.name, "Computer"
    # *****INTERGRATION TESTING*****
  end

  def test_computer_fires
    user = Player.new("User")
    computer = Computer.new("Computer")
    game = Game.new(user, computer)
    game.computer_fires
    array = []
    user.board.cells.keys.each do |key|
      if user.board.cells[key].render(true) == "M"
        array << key
      end
      array
    end
    assert_equal 1, array.count
  end

end
