# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'board'

describe Board do
  before(:each) do
    @board = Board.new
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

  it "prints the board" do
    @board.print_board
  end

end