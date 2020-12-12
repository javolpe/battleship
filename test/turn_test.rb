require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_cruiser_is_created


    assert_equal turn.computer_places_cruiser, (first_coordinate = "A1")
    assert_equal turn.computer_places_cruiser, (first_coordinate = "A2")
    assert_equal turn.computer_places_cruiser, (first_coordinate = "A3")
  end

end
