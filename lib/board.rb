require './lib/cell'
require './lib/ship'


class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
      }
  end


  def valid_coordinate?(coordinate)
    cells.keys.include?(coordinate)
  end



  def array_equals_ship_length?(ship, cell_array)
    if ship.length == cell_array.length
      true
    elsif ship.length != cell_array.length
      false
    end
  end

  def check_letters_are_the_same?(array)
    letters = []
      array.each do |coordinate|
        letters << coordinate[0]
      end
      if letters.uniq.length == 1
        true
      elsif letters.uniq.length > 1
        false
      end
  end

  def check_the_numbers_are_consecutive?(array)
    numbers = []
    array.each do |coordinate|
      numbers << coordinate[1].to_i
    end

    numbers.each_cons(2).all? {|a, b| b == a + 1 }
  end

  def check_letters_are_consecutive?(array)
    letters = []
    array.each do |coordinate|
      letters << coordinate[0]
    end

    letters.each_cons(2).all? {|a, b| b.ord == (a.ord + 1)}
  end

  def check_numbers_are_the_same?(array)
    numbers = []
      array.each do |coordinate|
        numbers << coordinate[1]
      end
      if numbers.uniq.length == 1
        true
      elsif numbers.uniq.length > 1
        false
      end
  end

  def valid_placement?(ship, array)
    array.each do |cell|
      if valid_coordinate?(cell) == false
        return false
      end
    end

    array.each do |x|
      if cells[x].empty? == false
          return false
      end
    end

    if array_equals_ship_length?(ship, array) == false
      return false
    end
    if check_letters_are_the_same?(array) && check_the_numbers_are_consecutive?(array)
      return true
    elsif check_letters_are_consecutive?(array) && check_numbers_are_the_same?(array)
      return true
    else false
    end
  end

  def place(ship, array)
    if valid_placement?(ship, array) == false
      return false
    end

    array.each do |x|
      cells[x].place_ship(ship)
    end
  end

  def render(user = false)
    if user == true
      puts "  1 2 3 4 \n" +
           "A #{cells["A1"].render(user)} #{cells["A2"].render(user)} #{cells["A3"].render(user)} #{cells["A4"].render(user)} \n" +
           "B #{cells["B1"].render(user)} #{cells["B2"].render(user)} #{cells["B3"].render(user)} #{cells["B4"].render(user)} \n" +
           "C #{cells["C1"].render(user)} #{cells["C2"].render(user)} #{cells["C3"].render(user)} #{cells["C4"].render(user)} \n" +
           "D #{cells["D1"].render(user)} #{cells["D2"].render(user)} #{cells["D3"].render(user)} #{cells["D4"].render(user)} \n"
    elsif user == false
      puts "  1 2 3 4 \n" +
           "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
           "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
           "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
           "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n"
    end

  end
end
