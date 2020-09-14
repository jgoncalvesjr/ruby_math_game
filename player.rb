#  Generates a player with lives, manages when a player loses a life

class Player 
  
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

end
