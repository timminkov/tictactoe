class PlayerInput
  attr_reader :io

  def initialize(io)
    @io = io
  end

  def get_players
    @io.puts "Welcome to Tic Tac Toe! Please enter the number of players (1-2)."
    while (((players = @io.gets.chomp.to_i) != 1) && (players != 2))
      @io.puts "Invalid entry. Please choose between 1-2 players."
    end
    players
  end

  def get_name(current_player)
    player = (current_player == :player1) ? '1' : '2'
    @io.puts "Hello Player " + player + "! Please enter your name"
    while (name = @io.gets.chomp) == ''
      @io.puts "Sorry! You must enter a name. Please try again."
    end
    name
  end

  def get_move(name)
    @io.puts name + ", please make your move."
    while !(move = @io.gets.chomp.to_i - 1).between?(0,8)
      @io.puts "Sorry, that is not a valid move. Please enter a valid move."
    end
    move
  end

  def get_piece(name)
    @io.puts name + ", please choose either x or o."
    while (((piece = @io.gets.chomp.upcase) != 'X') && (piece != 'O'))
      @io.puts "You have entered an invalid piece. Please enter either x or o."
    end
    piece
  end
end