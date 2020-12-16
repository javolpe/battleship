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

end
