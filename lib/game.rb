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
    self.create_players(@players = @io.get_players)
    board = Board.new
    @io.example_board
    
    board = self.loop_turns(board, @players)

    @io.print_board(board)
    @io.winner(@player1, @player2, board)
  end

  def loop_turns(board, players)
    turn = check_turn(@player1.piece)
    
    while !board.game_over?
      @io.print_board(board)
      if turn == :p1
        board = @player1.turn(board)
        turn = :p2
      else
        board = @player2.turn(board)
        @io.computer_turn if players == 1
        turn = :p1
      end
    end
    board
  end

  private

  def check_turn(piece)
    return :p1 if piece == 'X'
    return :p2 if piece == 'O'
  end
end