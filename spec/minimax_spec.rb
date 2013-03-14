require 'minimax'
require 'board'

describe Minimax do
  before(:each) do
    @minimax= Minimax.new('X')
  end

  describe "#initialize" do
    it "takes in and returns the current player" do
      @minimax.player.should == 'X'
    end
  end

  describe "#next_turn" do
    it "returns the next player's turn" do
      @minimax.next_turn('X').should == 'O'
      @minimax.next_turn('O').should == 'X'
    end
  end

  describe "#score" do
    it "returns a score for a completed board" do
      @board1= Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])
      @minimax.score(@board1).should == 1

      @board2= Board.new(['O','O','O',' ',' ',' ',' ',' ',' '])
      @minimax.score(@board2).should == -1

      @board3= Board.new(['X','O','X','O','X','O','O','X','O'])
      @minimax.score(@board3).should == 0
    end
  end

  describe "#minimax" do
    it "checks if the game is over and returns the score" do
      @board1= Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])
      
      @board1.game_over?.should == true
      @minimax.minimax(@board1, 'X').should == 1
    end
  end
end