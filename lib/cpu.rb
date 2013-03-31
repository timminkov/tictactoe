require 'minimax'
require 'base_player'

class Cpu < BasePlayer
  attr_accessor :piece, :name, :minimaxer

  def initialize
    @name = 'CPU'
    @checked = false
  end

  def turn(board)
    @minimaxer = Minimax.new(@piece)
    if first_turn?(board)
      board.move(0, 'X')
      return board
    end
    children = board.children(@piece)
    children.max_by { |child| @minimaxer.minimax(child, other_piece) }
  end

  private

  def first_turn?(board)
    board.data.all? { |cell| cell == ' '  }
  end
end