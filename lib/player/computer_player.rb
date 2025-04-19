# Inherits from class Player
require_relative '../player'
# Computer player that inherits from class Player
class ComputerPlayer < Player
  COLOR = %w[BLUE ORANGE GREEN VIOLET].freeze
  def initialize(name)
    super
    @color_feedback = []
  end

  def random_color
    c = rand(0..3)
    COLOR[c]
  end

  def create_code
    (0..3).each do |color|
      @color_code[color] = random_color
    end
  end

  def code_white(player)
    @white_feedback = @color_code.reduce([]) { |color_code, color| color_code << color }
    player.color_code.each_with_index do |color, index|
      next unless @white_feedback[index] == (color)

      @color_feedback << 'WHITE'
      @white_feedback[index] = nil
      player.color_code[index] = nil
    end
  end

  def code_red(player)
    print @white_feedback
    player.color_code.each do |color|
      next if color.nil?
      next unless @white_feedback.include?(color)

      index = @white_feedback.find_index(color)
      @color_feedback << 'RED'
      @white_feedback[index] = nil
    end
  end

  def reset
    @color_feedback = []
  end

  def create_feedback(player)
    code_white(player)
    code_red(player)
    puts @color_feedback
    reset
  end
end
