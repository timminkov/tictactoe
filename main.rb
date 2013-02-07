class Board
  def initialize(board = [' ',' ',' ',' ',' ',' ',' ',' ',' '])
    @board = board
  end

  attr_accessor :board

  def place(move, piece)
    @board[move] = piece
  end

  def board_print
    puts @board[0] + '|' + @board[1] + '|' + @board[2] +  "\n" + '- ' + '- ' + '-' + "\n" + @board[3] + '|' + @board[4] + '|' + @board[5] +  "\n" + '- ' + '- ' + '-' + "\n" + @board[6] + '|' + @board[7] + '|' + @board[8] +  "\n"
  end

  def example_board
    puts '1' + '|' + '2' + '|' + '3' +  "\n" + '- ' + '- ' + '-' + "\n" + '4' + '|' + '5' + '|' + '6' +  "\n" + '- ' + '- ' + '-' + "\n" + '7' + '|' + '8' + '|' + '9' +  "\n"
  end

  def game_states(player = nil)
    children = Array.new
    x = 0
    while x < 9
      tempboard = @board.dup
      if tempboard[x] == ' '
        tempboard[x] = player
        children<<Board.new(tempboard)
      end
      x += 1
    end
    children

  end

  def game_over?
    if winning_letter != nil
      true
    else
      false
    end
  end

  def winning_letter
    if match?(0, 1, 2)
      return @board[0]
    elsif match?(3, 4, 5)
      return @board[3]
    elsif match?(6, 7, 8)
      return @board[6]
    elsif match?(0, 3, 6)
      return @board[0]
    elsif match?(1, 4, 7)
      return @board[1]
    elsif match?(2, 5, 8)
      return @board[2]
    elsif match?(0, 4, 8)
      return @board[0]
    elsif match?(2, 4, 6)
      return @board[2]
    elsif ((@board[0] != ' ') && (@board[1] != ' ') && (@board[2] != ' ') && (@board[3] != ' ') && (@board[4] != ' ') && (@board[5] != ' ') && (@board[6] != ' ') && (@board[7] != ' ') && (@board[8] != ' '))
      return 'tie'
    else
      return nil
    end
  end

    private

    def match?(firstpos, secondpos, thirdpos)
      [@board[firstpos], @board[secondpos], @board[thirdpos]].all? {|piece| piece == @board[firstpos] && @board[firstpos] != ' '}
    end
end

class Minimax
  def initialize(player)
    @player = player
  end

  def minimax(board, player = @player)
    if board.game_over? == true
      return score(board)
    end

    children = board.game_states(player)
    scores = children.map {|child| minimax(child, next_turn(player)) }

    return scores.max if player == @player
    
    scores.min
  end

  def score(board)
    if board.winning_letter == @player
      1
    elsif board.winning_letter == 'tie'
      0
    else
      -1
    end
  end

  def next_turn(player)
    if player == 'X'
      return 'O'
    else
      return 'X'
    end
  end


end

class Player
  def initialize(name)
    @name = name
  end

  attr_accessor :name, :piece

  def piece=(piece = 'X')
    @piece = piece
  end

  def first?
    if @piece == 'X'
      true
    else
      false
    end
  end
end

def get_input
  input = gets.chomp
  if input == "Exit"
    puts "Thanks for playing!"
    exit
  else
    input
  end
end

puts "Welcome to Tic Tac Toe. Enter 1 for 1 player or 2 for 2 players."
players = get_input.to_i
if players == 2
  puts "Welcome to Tic Tac Toe player 1. Please enter your name!"
  player1 = Player.new(get_input)
  puts "Hello " + player1.name + ". Please choose between X and O!"
  player1.piece= get_input
  puts "Player 1 has chosen " + player1.piece + "!"
  puts "Player 2, please enter your name!"
  player2 = Player.new(get_input)
  if player1.piece == "X"
    player2.piece = "O"
  else
    player2.piece = "X"
  end
  puts "Hello " + player2.name + "!. Since " + player1.name + " chose " + player1.piece + " you have been assigned " + player2.piece + "."
  board = Board.new
  board.example_board
  puts "In tic tac toe, the player that choses X goes first."
  if player1.first?
    turn = :p1;
  else
    turn = :p2;
  end


  while board.winning_letter == nil
    board.board_print
    if turn == :p1
      puts player1.name + ", please select your move."
      board.place(get_input.to_i-1, player1.piece)
      turn = :p2
    else turn == :p2
      puts player2.name + ", please select your move."
      board.place(get_input.to_i-1, player2.piece)
      turn = :p1
    end
  end
  board.board_print
  if player1.piece == board.winning_letter
    puts "Congratulations " + player1.name + "! You win!"
  elsif player2.piece == board.winning_letter
    puts "Congratulations " + player2.name + "! You win!"
  elsif board.winning_letter == 'tie'
    puts "We have ourselves a tie!"
  end
end

if players == 1
  puts "Welcome to Tic Tac Toe player 1. Please enter your name!"
  player1 = Player.new(get_input)
  player2 = Player.new('CPU')
  puts "Hello " + player1.name + ". Please choose between X and O!"
  player1.piece= get_input
  puts "You have chosen " + player1.piece + "!"

  board = Board.new
  board.example_board
  if player1.piece == 'X'
    player2.piece = 'O'
  else
    player2.piece = 'X'
  end
   puts "In tic tac toe, the player that choses X goes first."
  if player1.first?
    turn = :p1;
  else
    turn = :p2;
  end

  puts "Please enter 1 for easy CPU and 2 for unbeatable CPU"
  difficulty = get_input
  if difficulty == 1
    while board.winning_letter == nil
      board.board_print
      if turn == :p1
        puts player1.name + ", please select your move."
        board.place(get_input.to_i-1, player1.piece)
        turn = :p2
      else turn == :p2
        aimove = rand(8)
        while turn == :p2
          if board.board_pos(aimove) == ' '
            board.place(aimove, player2.piece)
            turn = :p1
          else
            aimove = rand(8)
          end
        end
        puts "The AI selects #{aimove+1} as its move."
      end
    end
    board.board_print
    if player1.piece == board.winning_letter
      puts "Congratulations " + player1.name + "! You win!"
    elsif player2.piece == board.winning_letter
      puts "You lose! The computer wins!"
    elsif board.winning_letter == 'tie'
      puts "We have ourselves a tie!"
    end
  else
    minimaxer = Minimax.new(player2.piece)
    while board.winning_letter == nil
      board.board_print
      if turn == :p1
        puts player1.name + ", please select your move."
        board.place(get_input.to_i-1, player1.piece)
        turn = :p2
      else
        children = board.game_states(player2.piece)
        
        board = children.max_by { |child| minimaxer.minimax(child, player1.piece) }
        turn = :p1
      end
    end
    board.board_print
    if player1.piece == board.winning_letter
      puts "Congratulations " + player1.name + "! You win!"
    elsif player2.piece == board.winning_letter
      puts "You lose! The computer wins!"
    elsif board.winning_letter == 'tie'
      puts "We have ourselves a tie!"
    end
  end
end

