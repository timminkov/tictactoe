class Player
  attr_accessor :name, :piece

  def initialize(io)
    @io = io
  end

  def turn(board)
    @io.get_move(@name)
  end
  
end