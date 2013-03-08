require 'cpu'
require 'board'

describe Cpu do
  before(:each) do
    @cpu = Cpu.new
  end

  describe "#piece" do
    it "takes in a piece and outputs it" do
      @cpu.piece = 'X'
      @cpu.piece.should == 'X'
    end
  end

  describe "#turn" do
    it "calls children on board" do
      board = double("board")
      board1 = Board.new(['X','X','O','O','O','X','X','O',' '])
      boards = [board1]
      @cpu.piece = 'X'
      board.should_receive(:children).with('X').and_return(boards)
      @cpu.turn(board)
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