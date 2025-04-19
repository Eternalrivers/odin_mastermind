require_relative '../player'
# Human player
class HumanPlayer < Player
  COLOR = %w[BLUE ORANGE GREEN VIOLET].freeze

  def input_color_code
    puts 'BLUE, ORANGE, GREEN, VIOLET'
    i = 0
    while i < 4
      puts "Please guess the No.#{i + 1} color  "
      @color_code[i] = gets.upcase.chomp
      i += 1
    end
    puts "You've chosen #{@color_code}"
  end
end
