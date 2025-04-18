# Inherits from class Player
require_relative '../player'
# Computer player that inherits from class Player
class ComputerPlayer < Player
  COLOR = %w[BLUE ORANGE GREEN VIOLET].freeze
  def random_color
    c = rand(0..3)
    COLOR[c]
  end

  def create_code
    (0..3).each do |color|
      @color_code[color] = random_color
    end
  end
end
