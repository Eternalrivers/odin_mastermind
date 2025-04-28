require_relative '../lib/player/computer_player'
require_relative '../lib/player/human_player'

# class Game
class Game
  def initialize(human_player, computer_player)
    @human_player = human_player.new('Player 1')
    @computer_player = computer_player.new('Computer player')
  end

  def play
    @computer_player.create_code

    i = 0
    loop do
      puts @human_player.input_color_code
      puts @computer_player.create_feedback(@human_player)
      i += 1
      break if i == 12 || @human_player.color_code == @computer_player.color_code
    end
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
