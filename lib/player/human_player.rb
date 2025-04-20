require_relative '../player'
# Human player
class HumanPlayer < Player
  COLOR = %w[BLUE ORANGE GREEN VIOLET].freeze

  def input
    i = 0
    while i < 4
      puts "\nPlease guess the No.#{i + 1} color  "
      @color_code[i] = gets.upcase.chomp
      unless COLOR.include?(@color_code[i])
        puts "Wrong Input! Please choose one of the colors #{COLOR}"
        redo
      end
      i += 1
    end
  end

  def input_color_code
    puts 'BLUE, ORANGE, GREEN, VIOLET'
    input
    puts "You've chosen #{@color_code}"
  end
end
