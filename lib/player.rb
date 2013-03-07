class Player
  attr_accessor :name, :piece

  def initialize(io)
    @io = io
  end

  def turn(board)
    board.print_board
    board.move(@io.get_move(@name, board), @piece)
    board
  end
  
end