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

  def test_placing_a_ship_cell_is_not_empty
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cell_1.empty?, false
    assert_equal cell_2.empty?, false
    assert_equal cell_3.empty?, false
  end

  def test_placing_a_ship_cell_on_proper_cells_contain_same_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cell_1.ship == cell_2.ship, true
    assert_equal cell_2.ship == cell_3.ship, true
  end

  def test_placing_a_ship_cell_on_proper_cells_contain_same_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_4 = board.cells["A4"]


    assert_equal cell_3.ship == cell_4.ship, false
  end

  def test_render_board_start
    board = Board.new
    expected = puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, board.render
  end

  def test_render_board_ships_hidden
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    expected = puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, board.render
  end

  def test_render_board_ships_shown
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    expected = puts "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, board.render(true)
  end

  def test_render_board_ships_hit
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_1.fire_upon
    expected = puts "  1 2 3 4 \nA H S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, board.render(true)
  end

  def test_render_board_ships_sunk
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_1.fire_upon
    cell_2.fire_upon
    cell_3.fire_upon
    expected = puts "  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, board.render(true)
  end

end
