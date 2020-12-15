require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_player_exists
    computer = Computer.new("user")

    assert_instance_of Computer, computer
  end


  def test_it_has_readable_attributes
    computer = Computer.new("computer")

    assert_equal computer.name, "computer"
    assert_equal computer.board.cells.keys.length, 16
  end
end
