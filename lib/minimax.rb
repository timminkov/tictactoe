class Minimax
  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def next_turn(player)
    player == 'X' ? 'O' : 'X'
  end

  def score(board)
    if board.status == @player
      1
    elsif board.status == 'tie'
      0
    else
      -1
    end
  end

  def minimax(board, player = @player)
    return score(board) if board.game_over?

    children = board.children(player)
    scores = children.map {|child| minimax(child, next_turn(player)) }

    return scores.max if player == @player
    scores.min
  end

end