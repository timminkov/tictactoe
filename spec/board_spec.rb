require 'board'

describe Board do
  before(:each) do
    @board = Board.new
  end

  describe "#move_available?" do
    before(:each) do
      @board2 = Board.new(['O','X','O','X',' ','X','X',' ',' '])
    end

    it "returns true if a board space is blank" do
      expect(@board2.move_available?(4)).to be(true)
      expect(@board2.move_available?(7)).to be(true)
      expect(@board2.move_available?(8)).to be(true)
    end

    it "returns false if a board space is taken" do
      expect(@board2.move_available?(0)).to be(false)
      expect(@board2.move_available?(3)).to be(false)
    end
  end

  describe "#initialize" do
    it "is initialized with a new empty board" do
      board = Board.new
      expect(board.data).to eq [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    end

    it "can be initialized with a different board" do
      board = Board.new(['O','X','O','X',' ','X','X',' ',' '])
      expect(board.data).to eq ['O','X','O','X',' ','X','X',' ',' ']
    end
  end

  describe "#move" do
    it "places a piece on the board" do
      @board.move(0,'X')
      expect(@board.data).to eq ['X',' ',' ',' ',' ',' ',' ',' ',' ']

      @board.move(1,'O')
      expect(@board.data).to eq ['X','O',' ',' ',' ',' ',' ',' ',' ']
    end
  end

  describe "#match?" do
    it "checks if three positions in an array are equal" do
      board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
      expect(board2.match?([0, 1, 2])).to be(true)
      expect(board2.match?([2, 3, 4])).to be(false)
    end

    it "will return false if one of the board positions is blank" do
      board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
      expect(board2.match?([6, 7, 8])).to be(false)
    end
  end

  describe "#status" do
    it "checks if a board is a tie" do
      @board2 = Board.new(['X','X','O','O','X','X','X','O','O'])
      expect(@board2.status).to eq 'tie'

      board = Board.new(['X','O','X','O',' ',' ',' ',' ',' '])
      expect(board.status).to_not eq 'tie'
    end

    it "checks if a board winner is an X" do
      @board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
      expect(@board2.status).to eq 'won'
    end

    it "checks if a board winner is an O" do
      @board2 = Board.new(['O','X','O','X','O','X','X','X','O'])
      expect(@board2.status).to eq 'won'
    end
  end


  describe "#winner" do
    it "checks if a board winner is an X" do
      @board2 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
      expect(@board2.winner).to eq 'X'
    end

    it "checks if a board winner is an O" do
      @board2 = Board.new(['O','X','O','X','O','X','X','X','O'])
      expect(@board2.winner).to eq 'O'
    end
  end
  describe "#game_over?" do
    it "checks if a board over" do
      @board2 = Board.new(['X',' ','O','O','X','X','X','O','O'])
      expect(@board2.game_over?).to eq false

      @board3 = Board.new(['X','X','O','O','X','X','X','O','O'])
      expect(@board3.game_over?).to eq true

      @board4 = Board.new(['X','X','X','O','O',' ',' ',' ',' '])
      expect(@board4.game_over?).to eq true
      
      @board5 = Board.new(['X','X',' ','O','O','O',' ',' ',' '])
      expect(@board5.game_over?).to eq true
    end
  end

  describe "#children" do
    it "returns an array of boards with possible next moves" do
      @board2 = Board.new(['O','X','O','X','O','X','X',' ',' '])
      children = @board2.children('X')
      expect(children.length).to eq 2
      children[0].data.should =~ (['O','X','O','X','O','X','X','X',' '])
      children[1].data.should =~ (['O','X','O','X','O','X','X',' ','X'])
    end
  end
end
