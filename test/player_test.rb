require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'


class PlayerTest < Minitest::Test
  def test_player_exists
    user = Player.new("user")

    assert_instance_of Player, user
  end


  def test_it_has_readable_attributes
    user = Player.new("user")

    assert_equal user.name, "user"
    assert_equal user.board.cells.keys.length, 16
  end

  def test_has_user_lost?
    computer = Computer.new("user")
    user = Player.new("user")
    user.board.place(user.cruiser, ["A1", "A2", "A3"])
    user.board.place(user.submarine, ["B1", "B2"])
    user.board.cells["A1"].fire_upon
    user.board.cells["A2"].fire_upon
    user.board.cells["A3"].fire_upon
    user.board.cells["B1"].fire_upon
    user.board.cells["B2"].fire_upon

    assert_equal true, user.has_user_lost?
  end

end
