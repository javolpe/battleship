require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_ship_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_readable_attributes
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser.name, "Cruiser"
    assert_equal cruiser.length, 3
  end
end
