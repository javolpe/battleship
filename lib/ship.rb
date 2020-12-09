class Ship
  attr_reader :name,
              :length

  attr_accessor :health

  def initialize(name, length)
    @name   = name
    @length = length
    @health = length
  end

  def health
    @health
  end

  def sunk?
    if @health > 0
      false
    elsif @health <= 0
      true
    end
  end

  def hit
    @health -= 1
  end
end
