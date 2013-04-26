class Board
  attr_reader :data

  def initialize(board = [' ',' ',' ',' ',' ',' ',' ',' ',' '])
    @data = board
  end

  def move(move, piece)
    @data[move] = piece
  end

  def game_over?
    self.status != nil
  end

  def children(player = nil)
    children = Array.new
    9.times do |i|
      tempboard = @data.dup
      if tempboard[i] == ' '
        tempboard[i] = player
        children<<Board.new(tempboard)
      end
    end
    children
  end

  def status
    case
      when winner == 'X' || winner == 'O' then 'won'
      when @data.all? {|place| place != ' '} then 'tie'
      else nil
    end
  end

  def match?(pos1, pos2, pos3)
    ((@data[pos1] == @data[pos2]) && (@data[pos2] == @data[pos3]) && (@data[pos1] != ' '))
  end

  def move_available?(move)
    @data[move] == ' '
  end

  def winner
    case
      when match?(0, 1, 2) then @data[0]
      when match?(3, 4, 5) then @data[3]
      when match?(6, 7, 8) then @data[6]
      when match?(0, 3, 6) then @data[0]
      when match?(1, 4, 7) then @data[1]
      when match?(2, 5, 8) then @data[2]
      when match?(0, 4, 8) then @data[0]
      when match?(2, 4, 6) then @data[2]
    end
  end
end
