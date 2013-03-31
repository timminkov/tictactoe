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
      board1= Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])
      @minimax.score(board1).should == 1

      board2= Board.new(['O','O','O',' ',' ',' ',' ',' ',' '])
      @minimax.score(board2).should == -1

      board3= Board.new(['X','O','X','O','X','O','O','X','O'])
      @minimax.score(board3).should == 0
    end

    it "can find scores many levels deep" do
      board = Board.new(['X',' ',' ',' ',' ',' ',' ',' ',' '])
      @minimax.minimax(board).should == 1
    end
  end

  describe "#minimax" do
    it "checks if the game is over for board1 and returns 1" do
      board1 = Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])

      @minimax.minimax(board1, 'X').should == 1
    end

    it "checks if the game is over for board2 and returns -1" do
      board2 = Board.new(['O','O','O',' ',' ',' ',' ',' ',' '])
      board2.game_over?.should == true

      @minimax.minimax(board2, 'X').should == -1
    end

    it "checks if the game is over for board3 and returns 0" do
      board2 = Board.new(['X','O','X','O','X','X','O','X','O'])
      board2.game_over?.should == true

      @minimax.minimax(board2, 'X').should == 0
    end

    it "returns a 1 if you can win next turn" do
      board = Board.new(['X','O','X',
                         'O','X','X',
                         'O','O',' '])

      @minimax.minimax(board, 'X').should == 1
    end

    it "returns 0 if you tie next turn" do
      board = Board.new(['X','O','X',
                         'X','O','O',
                         'O','X',' '])

      @minimax.minimax(board, 'X').should == 0
    end

    it "returns -1 if you lose no matter what in 2 turns" do
      board = Board.new([' ','O',' ',
                         'X','O','X',
                         'O','X','O'])

      @minimax.minimax(board, 'X').should == -1
    end

    it "returns 1 if your opponent will lose no matter what" do
      board = Board.new([' ','X',' ',
                         'X','O','X',
                         'O','X',' '])
      
      @minimax.minimax(board, 'X').should == 1
    end
  end
end