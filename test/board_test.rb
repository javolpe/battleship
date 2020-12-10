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


end
