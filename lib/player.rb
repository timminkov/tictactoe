class Player
  attr_accessor :name, :piece

  def initialize(io)
    @io = io
  end

  def turn(board)
    board.move(@io.get_move(@name, board), @piece)
    board
  end

  def other_piece(piece)
    return 'X' if piece == 'O'
    'O' if piece == 'X'
  end
end