require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test

  def test_board_exists_as_a_class
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_creates_cells_properly
    board = Board.new
    board.cells

    assert_equal board.cells.keys.length, 16
    assert_equal board.cells.values.length, 16
    assert_equal board.cells["A1"].class, Cell
  end

  def test_board_contains_valid_coordinates_false?
    board = Board.new
    board.cells

    assert_equal  board.valid_coordinate?("E1"), false
  end

  def test_board_contains_valid_coordinates_true?
    board = Board.new
    board.cells

    assert_equal  board.valid_coordinate?("D1"), true
  end

  def test_array_equals_ship_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal board.array_equals_ship_length?(cruiser, ["A1", "A2"]), false
  end

  def test_array_equals_ship_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal board.array_equals_ship_length?(cruiser, ["A1", "A2", "A3"]), true
  end

  def test_check_the_letters_are_the_same_true
    board = Board.new
    expected = board.check_letters_are_the_same?(["A1", "A2", "A3"])

    assert_equal expected, true
  end

  def test_check_the_letters_are_the_same_false
    board = Board.new

    expected = board.check_letters_are_the_same?(["B1", "A2", "A3"])

    assert_equal expected, false
  end

  def test_check_the_numbers_are_consecutive_true
    board = Board.new
    expected = board.check_the_numbers_are_consecutive?(["B1", "A2", "A3"])

    assert_equal expected, true
  end

  def test_check_the_numbers_are_consecutive_false
    board = Board.new
    expected = board.check_the_numbers_are_consecutive?(["B3", "A2", "A3"])

    assert_equal expected, false
  end

  def test_check_the_letters_are_consecutive_true
    board = Board.new
    expected = board.check_letters_are_consecutive?(["A3", "B2", "C3"])

    assert_equal expected, true
  end

  def test_check_the_letters_are_consecutive_false
    board = Board.new
    expected = board.check_letters_are_consecutive?(["A3", "C2", "C3"])

    assert_equal expected, false
  end

  def test_check_the_numbers_are_the_same_true
    board = Board.new

    expected = board.check_numbers_are_the_same?(["A1", "B1", "C1"])

    assert_equal expected, true
  end

  def test_check_the_numbers_are_the_same_false
    board = Board.new

    expected = board.check_numbers_are_the_same?(["A1", "B2", "C1"])

    assert_equal expected, false
  end

  def test_valid_placement_nonconsecutive_numbers?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected = board.valid_placement?(cruiser, ["A1", "A2", "A4"])

    assert_equal expected, false
  end

  def test_valid_placement_consecutive_numbers?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected = board.valid_placement?(cruiser, ["A1", "A2", "A3"])

    assert_equal expected, true
  end

  def test_valid_placement_nonconsecutive_letters?
    board = Board.new
    submarine = Ship.new("submarine", 2)
    expected = board.valid_placement?(submarine, ["A1", "C1"])

    assert_equal expected, false
  end

  def test_valid_placement_consecutive_letters?
    board = Board.new
    submarine = Ship.new("submarine", 2)
    expected = board.valid_placement?(submarine, ["A1", "B1"])

    assert_equal expected, true
  end



end
