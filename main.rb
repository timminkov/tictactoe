# To change this template, choose Tools | Templates
# and open the template in the editor.


class Board
  attr_accessor :data

  def initialize(board = [' ',' ',' ',' ',' ',' ',' ',' ',' '])
    @data = board
  end

  def move(move, piece)
    @data[move] = piece
  end

  def game_over?
    self.status != nil
  end

  def children(player)
    children = Array.new
    x = 0
    while x < 9
      tempboard = @data.dup
      if tempboard[x] == ' '
        tempboard[x] = player
        children<<Board.new(tempboard)
      end
      x += 1
    end
    children
  end

  def status
    case
      when match?(0, 1, 2) then @data[0]
      when match?(3, 4, 5) then @data[3]
      when match?(6, 7, 8) then @data[6]
      when match?(0, 3, 6) then @data[0]
      when match?(1, 4, 7) then @data[1]
      when match?(2, 5, 8) then @data[2]
      when match?(0, 4, 8) then @data[0]
      when match?(2, 4, 6) then @data[2]
      when ((@data[0] != ' ') && (@data[1] != ' ') && (@data[2] != ' ') && (@data[3] != ' ') && (@data[4] != ' ') && (@data[5] != ' ') && (@data[6] != ' ') && (@data[7] != ' ') && (@data[8] != ' ')) then 'tie'
      else nil
    end
  end

  def match?(pos1, pos2, pos3)
    ((@data[pos1] == @data[pos2]) && (@data[pos2] == @data[pos3]))
  end


end

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
    #scores = children.map {|child| minimax(child, next_turn(player)) }

    return scores.max if player == @player
    scores.min
  end

end

class Game
  attr_accessor :players

  def initialize
    puts "Welcome to Tic Tac Toe! Please enter the number of players (1-2)."
    @players = gets.chomp
  end

  def turn

  end
end