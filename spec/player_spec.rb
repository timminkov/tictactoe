require 'player'
require 'board'
require 'player_input'

describe Player do
  before(:each) do
    @io = double("playerinput")
    @player = Player.new(@io)
  end

  it "is initialized with a PlayerInput" do
    kern = Kernel
    io = PlayerInput.new(kern)
    player = Player.new(io)
  end
  describe "#name" do
    it "returns the name" do
      @player.name = 'Tim'
      @player.name.should == 'Tim'
    end
  end

  describe "#piece" do
    it "returns the piece" do
      @player.piece = 'X'
      @player.piece.should == 'X'
    end
  end

  describe "#turn" do
    before(:each) do
      @player.name = 'Tim'
      @board = Board.new
      @io.stub(:get_move)
    end
    
    it "takes in a board object" do
      @io.stub(:get_move)
      @player.turn(@board)
    end

    it "calls PlayerInput.get_move" do
      @io.should_receive(:get_move) {'Tim'}
      @player.turn(@board)
    end
    it "prints the board" do
      board = double("board")
      @player.turn(board)
      
    end
    it "checks to see if a move is available" do

    end
  end
end 