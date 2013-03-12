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
      @board = double("board")
      @io.stub(:get_move)
      @board.stub(:move)
    end
    
    it "takes in a board object" do
      @player.turn(@board)
    end

    it "calls PlayerInput.get_move" do
      @io.should_receive(:get_move).with('Tim', @board)
      @player.turn(@board)
    end

    it "calls move on board" do
      @board.should_receive(:move)
      @player.turn(@board)
    end
  end

  describe "#win" do
    it "announces that the player wins" do
      @player.name = 'Tim'
      @player.win
    end
  end
end 