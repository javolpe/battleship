require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_computer_exists
    computer = Computer.new("user")

    assert_instance_of Computer, computer
  end


  def test_it_has_readable_attributes
    computer = Computer.new("computer")

    assert_equal computer.name, "computer"
    assert_equal computer.board.cells.keys.length, 16
  end

  def test_computer_places_cruiser
    computer = Computer.new("user")
    computer.computer_places_cruiser
    array = []
    computer.board.cells.keys.each do |key|
      if computer.board.cells[key].render(true) == "S"
        array << key
      end
      array
  end

    assert_equal 3, array.count
  end

  def test_computer_places_submarine
    computer = Computer.new("user")
    computer.computer_places_submarine
    array = []
    computer.board.cells.keys.each do |key|
      if computer.board.cells[key].render(true) == "S"
        array << key
      end
      array
  end

    assert_equal 2, array.count
  end

  def test_true_computer_has_lost?
    computer = Computer.new("user")
    user = Player.new("user")
    user.board.place(computer.cruiser, ["A1", "A2", "A3"])
    user.board.place(computer.submarine, ["B1", "B2"])
    user.board.cells["A1"].fire_upon
    user.board.cells["A2"].fire_upon
    user.board.cells["A3"].fire_upon
    user.board.cells["B1"].fire_upon
    user.board.cells["B2"].fire_upon

    assert_equal true, computer.has_computer_lost?
  end

  def test_false_computer_has_lost?
    computer = Computer.new("user")
    user = Player.new("user")
    user.board.place(computer.cruiser, ["A1", "A2", "A3"])
    user.board.place(computer.submarine, ["B1", "B2"])
    user.board.cells["A1"].fire_upon
    user.board.cells["A2"].fire_upon
    user.board.cells["A3"].fire_upon
    user.board.cells["B1"].fire_upon

    assert_equal nil, computer.has_computer_lost?
  end

end
