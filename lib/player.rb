# creates player class
class Player
  def initialize(name)
    @name = name
    @color_code = Array.new(4)
  end

  attr_reader :name
  attr_accessor :color_code
end
