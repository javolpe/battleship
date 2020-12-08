require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'


class CellTest < Minitest::Test

  def test_that_cell_class_exisits
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_readalbe_attributes
    cell = Cell.new("B4")

    assert_equal cell.coordinate, "B4"
  end

  def test_does_not_contain_a_ship_object
    cell = Cell.new("B4")

    assert_equal cell.ship, nil
  end

  def test_does_contain_a_ship_object
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal cell.ship, cruiser
  end

  def test_cell_empty_before_ship_is_added
    cell = Cell.new("B4")

    assert_equal cell.empty?, true
  end

  def test_cell_empty_before_ship_is_added
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal cell.empty?, false
  end

end
