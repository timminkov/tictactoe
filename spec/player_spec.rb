require 'player'
require 'board'
require 'player_input'

describe Player do
  before(:each) do
    @playerinput = double("playerinput")
    @player = Player.new(@playerinput)
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
      @playerinput.stub(:get_move)
      @board.stub(:move)
    end
    
    it "calls PlayerInput.get_move" do
      @playerinput.should_receive(:get_move).with('Tim', @board)
      @player.turn(@board)
    end

    it "calls move on board" do
      @board.should_receive(:move)
      @player.turn(@board)
    end
  end
end 