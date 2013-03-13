require 'board'

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

  def get_name(player)
    @io.puts "Hello Player " + player.to_s + "! Please enter your name"
    while (name = @io.gets.chomp) == ''
      @io.puts "Sorry! You must enter a name. Please try again."
    end
    name
  end

  def get_move(name, board)
    @io.puts name + ", please make your move."
    while !(is_a_legal_move?((move = @io.gets.chomp.to_i - 1), board))
      if !(move.between?(0,8))
        @io.puts "Sorry, that is not a valid move. Please enter a valid move."
      else
        @io.puts "That space is occupied. Please make another move."
      end
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

  def is_a_legal_move?(move, board)
    move.between?(0,8) && board.move_available?(move)
  end

  def example_board
    @io.puts "1|2|3\n- - -\n4|5|6\n- - -\n7|8|9\n"
  end

  def print_board(board)
    @io.puts board.data[0] + '|' + board.data[1] + '|' + board.data[2] + "\n- - -\n" + board.data[3] + '|' + board.data[4] + '|' + board.data[5] + "\n- - -\n" + board.data[6] + '|' + board.data[7] + '|' + board.data[8] + "\n"
  end

  def winner(player1, player2, board)
    if board.status == player1.piece
      @io.puts player1.name + " wins!"
    elsif board.status == player2.piece && player2.name != 'CPU'
      @io.puts player2.name + " wins!"
    elsif board.status == player2.piece && player2.name == 'CPU'
      @io.puts "Sorry! The CPU won!"
    else
      @io.puts "It's a tie!"
    end
  end

  def computer_turn
    @io.puts "The computer has made its move..."
  end
end