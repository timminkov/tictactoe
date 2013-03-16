require 'cpu'
require 'board'

describe Cpu do
  before(:each) do
    @cpu = Cpu.new
  end

  describe "#initialize" do
    it "gets initialized with the name 'CPU'" do
      @cpu.name.should == 'CPU'
    end
  end

  describe "#piece" do
    it "takes in a piece and outputs it" do
      @cpu.piece = 'X'
      @cpu.piece.should == 'X'
    end
  end

  describe "#turn" do
    it "creates a new minimax object" do
      board = Board.new
      @cpu.turn(board)
      @cpu.minimaxer.should_not == nil
    end

    it "should return a completed board if given ['X','X','O','O','O','X','X','O',' ']" do
      board = Board.new(['X','X','O','O','O','X','X','O',' '])
      @cpu.piece = 'X'
      board = @cpu.turn(board)
      board.data.should == ['X','X','O','O','O','X','X','O','X']
    end

    it "resolves in a cats game when played against itself" do
      @cpu.piece = 'X'
      cpu2 = Cpu.new
      cpu2.piece = 'O'
      board = Board.new
      turn = 1

      while !board.game_over?
        if turn == 1
          board = @cpu.turn(board)
          turn = 2
        else
          board = cpu2.turn(board)
          turn = 1
        end
      end

      board.status.should == 'tie'
    end
  end

  describe "#other_piece" do
    it "returns 'X' if 'O' is passed in" do
      @cpu.other_piece('X').should == 'O'
    end

    it "returns 'O' if 'X' is passed in" do
      @cpu.other_piece('O').should == 'X'
    end
  end
end