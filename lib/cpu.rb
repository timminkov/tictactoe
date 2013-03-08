require 'minimax'

class Cpu
  attr_accessor :piece

  def turn(board)
    minimaxer = Minimax.new(@piece)
    children = board.children(@piece)
    board = children.max_by { |child| minimaxer.minimax(child, other_piece(@piece)) }
    board
  end

  def other_piece(piece)
    return 'X' if piece == 'O'
    'O' if piece == 'X'
  end
end