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

end
