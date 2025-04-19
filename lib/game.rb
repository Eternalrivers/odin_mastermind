require_relative 'lib/player/computer_player'
require_relative 'lib/player/human_player'
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
      puts @computer_player.create_feedback(human_player)
      i += 1
      break if i == 12 || @human_player.color_code == @computer_player.color_code
    end
  end
end
