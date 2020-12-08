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

  def test_ship_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser.health, 3
  end

  def test_ship_has_not_sunk
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser.sunk?, false
  end

  def test_ship_hit_reduce_health_by_one
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal cruiser.health, 2
  end

  def test_ship_has_sunk
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    assert_equal cruiser.sunk?, true
  end
end
