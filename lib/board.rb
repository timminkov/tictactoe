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

  def print_board
    puts @data[0] + '|' + @data[1] + '|' + @data[2] + "\n- - -\n" + @data[3] + '|' + @data[4] + '|' + @data[5] + "\n- - -\n" + @data[6] + '|' + @data[7] + '|' + @data[8]
  end

  def children(player)
    children = Array.new
    9.times do |i|
      tempboard = @data.dup
      if tempboard[i] == ' '
        tempboard[i] = player
        children << Board.new(tempboard)
      end
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
      when @data.all? {|place| place != ' '} then 'tie'
      else nil
    end
  end

  def match?(pos1, pos2, pos3)
    ((@data[pos1] == @data[pos2]) && (@data[pos2] == @data[pos3]))
  end


end