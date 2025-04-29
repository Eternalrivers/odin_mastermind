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

  def input_color_code
    (0..3).each do |color|
      @color_code[color] = random_color
    end
    puts @color_code
  end

  def white_feedback
    @color_code.reduce([]) { |color_code, color| color_code << color }
  end

  def red_feedback(player)
    player.color_code.reduce([]) { |color_code, color| color_code << color }
  end

  def code_white(player)
    @white_feedback = white_feedback
    @red_feedback = red_feedback(player)
    @red_feedback.each_with_index do |color, index|
      next unless @white_feedback[index] == (color)

      @color_feedback << 'WHITE'
      @white_feedback[index] = nil
      @red_feedback[index] = nil
    end
  end

  def code_red
    @red_feedback.each do |color|
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
    code_red
    puts @color_feedback
    reset
  end
end
