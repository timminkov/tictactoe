require 'player'
require 'cpu'
require 'player_input'

class Game
  attr_accessor :player1, :player2

  def initialize(io)
    @io = io
  end

  def create_players(players)
    @player1 = Player.new(@io)
    
    players == 1 ? @player2 = Cpu.new : @player2 = Player.new(@io)
    @player1.name = @io.get_name(1)
    @player2.name = @io.get_name(2) if players == 2

    @player1.piece = @io.get_piece(@player1.name)
    players == 2 ? @player2.piece = @player1.other_piece(@player1.piece) : @player2.piece = @player2.other_piece(@player1.piece)
  end

  def run
    self.create_players(@io.get_players)
    board = Board.new
    @io.example_board
    
    board = self.loop_turns(board)

    self.winner(board)

  end

  def loop_turns(board)
    @player1.piece == 'X' ? turn = :p1 : turn = :p2

    while !board.game_over?
      board.print_board
      if turn == :p1
        board = @player1.turn(board)
        turn = :p2
      else
        board = @player2.turn(board)
        turn = :p1
      end
    end
    board
  end

  def winner(board)
    board.print_board
    if board.status == @player1.piece
      @player1.win
    elsif board.status == @player2.piece
      @player2.win
    else
      puts "It's a tie!"
    end
  end
end

kern = Kernel
io = PlayerInput.new(kern)
game = Game.new(io)
game.run