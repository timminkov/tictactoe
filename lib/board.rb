class Board
  def initialize(board = [' ',' ',' ',' ',' ',' ',' ',' ',' '])
    @board_data = board
  end

  def move(move, piece)
    @board_data[move] = piece
  end

  def game_over?
    self.status != nil
  end

  def children(player = nil)
    children = Array.new
    9.times do |i|
      tempboard = @board_data.dup
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
      when @board_data.all? {|place| place != ' '} then 'tie'
      else nil
    end
  end

  def match?(positions)
    return false if @board_data[positions[0]] == ' '
    ((@board_data[positions[0]] == @board_data[positions[1]]) && (@board_data[positions[1]] == @board_data[positions[2]]))
  end

  def move_available?(move)
    @board_data[move] == ' '
  end

  def winner
    list_of_win_locations.each do |win_location|
      return @board_data[win_location[0]] if match?(win_location)
    end
  end
  
  def data
    return @board_data
  end

  private

  def list_of_win_locations
    [[0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]]
  end
end
