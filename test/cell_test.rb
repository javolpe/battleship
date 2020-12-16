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

  def test_received_shot_attribute_starts_at_false
    cell = Cell.new("B4")

    assert_equal cell.received_shot, false
  end

  def test_received_shot_attribute_changes_to_true
    cell = Cell.new("B4")
    cell.fire_upon

    assert_equal cell.fired_upon?, true
  end


  def test_fire_upon_method_lowers_health
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal cruiser.health, 2
  end

  def test_render_prints_period
    cell = Cell.new("B4")

    assert_equal cell.render, "."
  end

  def test_render_prints_m
    cell = Cell.new("B4")
    cell.fire_upon

    assert_equal cell.render, "M"
  end

  def test_render_prints_h
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    assert_equal cell.render, "H"
  end

  def test_render_prints_x
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    cell.fire_upon
    cell.fire_upon

    assert_equal cell.render, "X"
  end

  def test_render_prints_s
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal cell.render(true), "S"
  end

end
