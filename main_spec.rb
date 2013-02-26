# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'main'

describe Board do
  before(:each) do
    @board= Board.new
  end

  it "creates a new, empty board" do
    @board.data.should == [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  it "places a piece on the board" do
    @board.move(0,'X')
    @board.data.should == ['X',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  it "checks if three positions in an array are equal" do
    @board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
    @board2.match?(0, 1, 2).should == true
    @board2.match?(2, 3, 4).should == false
  end

  it "checks if a board is a tie" do
    @board2 = Board.new(['X','X','O','O','X','X','X','O','O'])
    @board2.status.should == 'tie'
  end

  it "checks if a board winner is an X" do
    @board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
    @board2.status.should == 'X'
  end

  it "checks if a board winner is an O" do
    @board2 = Board.new(['O','X','O','X','O','X','X','X','O'])
    @board2.status.should == 'O'
  end

  it "checks if a board over" do
    @board2 = Board.new(['X',' ','O','O','X','X','X','O','O'])
    @board2.game_over?.should == false
    @board3 = Board.new(['X','X','O','O','X','X','X','O','O'])
    @board3.game_over?.should == true
    @board4 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
    @board4.game_over?.should == true
    @board5 = Board.new(['X','X',' ','O','O','O',' ',' ',' '])
    @board5.game_over?.should == true
  end

  it "returns an array of boards with possible next moves" do
    @board2 = Board.new(['O','X','O','X','O','X','X',' ',' '])
    children = @board2.children('X')
    children.length.should == 2
    children[0].data.should =~ (['O','X','O','X','O','X','X','X',' '])
    children[1].data.should =~ (['O','X','O','X','O','X','X',' ','X'])
  end

end

describe Minimax do
  before(:each) do
    @minimax= Minimax.new('X')
  end

  it "takes in the current player" do
    @minimax.player.should == 'X'
  end

  it "returns the next player's turn" do
    @minimax.next_turn('X').should == 'O'
    @minimax.next_turn('O').should == 'X'
  end

  it "returns a score for a completed board" do
    @board1= Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])
    @board2= Board.new(['O','O','O',' ',' ',' ',' ',' ',' '])
    @board3= Board.new(['X','O','X','O','X','O','O','X','O'])
    @minimax.score(@board1).should == 1
    @minimax.score(@board2).should == -1
    @minimax.score(@board3).should == 0
  end

  it "checks if the game is over and returns the score" do
    @board1= Board.new(['X','X','X',' ',' ',' ',' ',' ',' '])
    @board1.game_over?.should == true
    @minimax.minimax(@board1, 'X').should == 1
  end

end

describe Game do
  before(:each) do
    @board= Board.new
    @minimax= Minimax.new('X')
    @game= Game.new
  end

  #it "asks the player for the number of players" do
    #@game.players.should == 1
  #end

  it "asks the player for a move" do

  end

end