require_relative 'lib/game'

puts 'Do you want to be the code maker or the code breaker?'
loop do
  @code = gets.chomp.upcase
  break if @code == 'CODE MAKER' || @code == 'CODE BREAKER'

  puts 'Invalid input. Please choose between CODE MAKER or CODE BREAKER'
end

if @code == 'CODE MAKER'
  code_maker = HumanPlayer
  code_breaker = ComputerPlayer
else
  code_maker = ComputerPlayer
  code_breaker = HumanPlayer
end

Game.new(code_breaker, code_maker).play
