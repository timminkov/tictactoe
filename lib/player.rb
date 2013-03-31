require 'base_player'

class Player < BasePlayer
  attr_accessor :name, :piece

  def initialize(io)
    @io = io
  end

  def turn(board)
    board.move(@io.get_move(@name, board), @piece)
    board
  end
end